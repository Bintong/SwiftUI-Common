//
//  Home.swift
//  CardScroll
//
//  Created by tongbin的mac on 2023/11/7.
//

import SwiftUI

struct Home: View {
    
    @State private var  allExpense:[Expense] = []
    @State private var activeCard: UUID?
    @Environment(\.colorScheme) private var scheme
    
    var body: some View {
        ScrollView(.vertical) { // main
            VStack(spacing: 0) {
                VStack (alignment: .leading,spacing: 15) {
                    Text("Hello Bintong")
                        .font(.largeTitle.bold())
                        .padding(.horizontal, 15)
                        .frame(height: 45)
                    // GeometryReader height
                    GeometryReader {
                        let rect = $0.frame(in: .scrollView)
                        let minY = rect.minY.rounded()
                        // card view
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 0) {
                                ForEach(cards) { card in
                                    ZStack {
                                        if minY == 75 {
                                            CardView(card)
                                        } else {
                                            if activeCard == card.id {
                                                CardView(card)
                                            } else {
                                                Rectangle()
                                                    .fill(.clear)
                                            }
                                        }
                                    }
                                    .containerRelativeFrame(.horizontal)
                                    
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollPosition(id: $activeCard)
                        .scrollTargetBehavior(.paging) // ios 17
                        .scrollClipDisabled()
                        .scrollIndicators(.hidden)
                        .scrollDisabled(minY != 75)
                    }
                    .frame(height: 125)
                   
                }
                
                // list
                LazyVStack(spacing: 15) {
                    Menu {
                        
                    } label: {
                        HStack(spacing: 4) {
                            Text("Filter By")
                            Image(systemName: "chevron.down")
                        }
                        .font(.caption)
                        .foregroundColor(.gray)
                        
                         
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    ForEach(allExpense) { expense in
                        ExpenseCardView(expense)
                    }
                }
                .padding(15)
                .mask { // 2
                    Rectangle()
                        .visualEffect { content, proxy in // ios 17
                            content.offset(y: backgoundLimitOffset(proxy))
                        }
                    
                }
                .background {
                    GeometryReader {
                        let rect = $0.frame(in: .scrollView)
                        let minY = min(rect.minY - 125 , 0)
                        let progress = max(min(-minY / 25, 1), 0)
                        RoundedRectangle(cornerRadius: 30 * progress, style: .continuous)
                            .fill(scheme == .dark ? .black : .white)
//                            .overlay(alignment: .top) {
//                                Text("\(minY)")
//                            }
                        
                            .visualEffect { content , proxy in // ios 17
                                content
                                    .offset(y: backgoundLimitOffset(proxy))
                            }
                    }
                }
                
                
            }
            .padding(.vertical,15)
            
        }
        .scrollTargetBehavior(CustomScrollBehaviour())
        .scrollIndicators(.hidden)
        .onAppear {
            if activeCard == nil {
                activeCard = cards.first?.id
            }
        }
        .onChange(of: activeCard) { oldValue, newValue in
            withAnimation(.snappy) {
                allExpense = expenses.shuffled()
            }
        }
    }
    
    // background limit offset
    func backgoundLimitOffset(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY
        return minY < 100 ? -minY + 100 : 0
    }
    
    
    // Card View
    
    @ViewBuilder
    func CardView(_ card: Card) -> some View {
        GeometryReader {
            let rect = $0.frame(in: .scrollView(axis: .vertical))
            let minY = rect.minY
            let topValue: CGFloat = 75.0
            let offset = min(minY - topValue, 0)
            let progress = max(min(-offset / topValue, 1), 0)
            let scale: CGFloat = 1 + progress
            ZStack {
                Rectangle()
                    .fill(card.bgColor)
                    .overlay(alignment: .leading){
                        Circle()
                            .fill(card.bgColor)
                            .overlay {
                                Circle()
                                    .fill(.white.opacity(0.2))
                                
                            }
                            .scaleEffect(2,anchor: .topLeading)
                        
                            .offset(x:-50,y:-40)
                        
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous))
                    .scaleEffect(scale, anchor: .bottom)
                
                VStack(alignment: .leading, spacing: 4 ,content: {
                    Spacer(minLength: 0)
                    Text("Current Balance \(progress)")
                        .font(.callout)
                    Text(card.balance)
                        .font(.title.bold())
                })
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(15)
                .offset(y: progress * -25)
                
            }
            .offset(y: -offset)
            .offset(y: progress * -topValue)
            
        }
        .padding(.horizontal,15)
    }
    // Expense Card View
    
    @ViewBuilder
    func ExpenseCardView(_ expense: Expense) -> some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 4, content: {
                Text(expense.product)
                    .font(.callout)
                    .fontWeight(.semibold)
                Text(expense.spendType)
                    .font(.caption)
                    .foregroundStyle(.gray)
                
            })
            
            Spacer(minLength: 0)
            
            Text(expense.amountSpent)
                .fontWeight(.bold)
        }
    }
    

    
    
}

// scroll target behaviour enddragging


struct CustomScrollBehaviour: ScrollTargetBehavior {
    func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
        if target.rect.minY < 75 {
            target.rect = .zero
        }
    }
}

#Preview {
    ContentView()
}
