//
//  ContentView.swift
//  TaskTest
//
//  Created by tongbin的mac on 2023/11/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button {
                testAwait()
            } label: {
                Text("Action")
            }

        }
        .padding()
    }
    
    func testTrasfer() {
        Task {
            
        }
    }
    
    func testAwait() {
        //
        
      
        Task {
            
            await withTaskGroup(of: Void.self) { group in
                for index in 0...2 {
                    await pickupOne(index)

                }
                
                group.addTask {
                    
                }
            }
            
        }
    }
    
    func pickupOne(_ i: Int) async {
        print("pickupOne =====\(i)")
    }
}

#Preview {
    ContentView()
}
