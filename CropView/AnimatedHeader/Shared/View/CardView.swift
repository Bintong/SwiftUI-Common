//
//  CardView.swift
//  AnimatedHeader
//
//  Created by tongbin的mac on 2023/9/8.
//

import SwiftUI

struct CardView: View {
    var food: Food
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10, content: {
                Text(food.title)
              
                    .fontWeight(.bold)
                Text(food.description)
                    .font(.caption)
                    .lineLimit(3)
                Text(food.price)
                    .fontWeight(.bold)
                
            })
            Spacer(minLength: 10)
            Image(food.image)
            
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130, alignment: .center)
                .cornerRadius(4)
            
            
        }
        .padding(.horizontal)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
