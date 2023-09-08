//
//  Home.swift
//  AnimatedHeader
//
//  Created by tongbin的mac on 2023/9/7.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    @Environment(\.colorScheme) var scheme
    var body: some View {
        ScrollView { 
            LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders] ) {
                
                // Parallax header
                GeometryReader{ reader -> AnyView in
                    let offset = reader.frame(in: .global).minY
                    if -offset >= 0 {
                        DispatchQueue.main.async {
                            self.homeData.offset = -offset
                        }
                    }
                    return AnyView(Image("choclates")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width,height: 250 + (offset > 0 ? offset : 0))
                        .cornerRadius(2)
                        .offset(y: (offset > 0 ? -offset : 0))
                        .overlay(
                            HStack {
                                Button {
                                
                                } label: {
                                    Image(systemName: "arrow.left")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                Button {
                                
                                } label: {
                                    Image(systemName: "suit.heart.fill")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.white)
                                }
                                
                                

                            }
                                .padding(),
                                alignment:.top
                        )
                        
)
                    
                    
                }
                .frame(height: 250)
                    Section(header: HeaderView()) {
                        ForEach(tabsItems) {tab  in
                            VStack(alignment: .leading, spacing: 15) {
                                Text(tab.tab)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.bottom)
                                    .padding(.leading)
                                ForEach(tab.foods){ food in
                                    CardView(food: food )
                                }
                                Divider()
                            }
                            .tag(tab.tab)
                            .overlay(
                                GeometryReader { reader -> Text in
                                    let offset = reader.frame(in:.global).minY
                                    let height = UIApplication.shared.windows.first!.safeAreaInsets.top + 100
                                    if offset < height && offset > 50 && homeData.selectedTab != tab.tab {
                                        DispatchQueue.main.async{
                                            self.homeData.selectedTab = tab.tab
                                        }
                                    }
                                    return Text("")
                                    
                                }
                            )
                            
                             
                        }
                     

                }
                
            }
        }
        .overlay(
            // safe area..
            (scheme == .dark ? Color.black : Color.white)
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                .ignoresSafeArea(.all,edges: .top)
                .opacity(homeData.offset > 250 ? 1 : 0)
            ,alignment:.top
                
        )
        .environmentObject(homeData)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
