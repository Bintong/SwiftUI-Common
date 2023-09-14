//
//  AllChatsView.swift
//  TelMac
//
//  Created by tongbin的mac on 2023/9/11.
//

import SwiftUI

struct AllChatsView: View {
    @EnvironmentObject var homeData: HomeViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .buttonStyle(.plain)

            }
            .padding(.horizontal)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $homeData.searchString)
                    .textFieldStyle(.plain)
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            .background(Color.primary.opacity(0.15))
            .cornerRadius(10)
            .padding()
            
            List(selection: $homeData.selectedRecentMsg) {
                ForEach(homeData.msgs) { message in
                    NavigationLink(destination: Text("Destination"), label: {
                        RecentCardView(recentMsg: message)
                    })
                    
                }
            }
            .listStyle(SidebarListStyle())
        }
        
    }
}

struct AllChatsView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
