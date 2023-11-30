//
//  TransFerActorActionViewModel.swift
//  TaskTest
//
//  Created by tongbin的mac on 2023/11/30.
//

import Foundation

actor TransFerActorActionViewModel:ObservableObject {
 
   @MainActor  @Published var change: Int = 0
  
    func testAction() {
        privateTest()
        privateTest2()
        privateTest3()
        privateTest4()
    }
    
    @MainActor
    func updateNumber(_ newNum: Int ) {
        self.change += 1
        Task {
            await testAction2()
        }
    }
    
    func testAction1() async{
        privateTest()
        privateTest2()
        privateTest3()
        privateTest4()
        
    }
    
    private func testAction2() async {
        let records = await fetchWeatherHistory() // 需要用的你回掉的时候 才用async
        let average = await calculateAverageTemperature(for: records)
        let response = await upload(result: average)
        try!await Task.sleep(seconds:  2)
        await MainActor.run {
            self.change += 3
        }
        print("Server response: \(response)")
    }
    
    func privateTest() {
        print("testAction")
    }
    
    func privateTest2() {
        print("testAction2")
    }
    
    func privateTest3() {
        print("testAction3")
    }
    
    func privateTest4() {
        print("testAction4")
    }
    
    
    func fetchWeatherHistory() async -> [Double] {
        (1...100_000).map { _ in Double.random(in: -10...30) }
    }

    func calculateAverageTemperature(for records: [Double]) async -> Double {
        let total = records.reduce(0, +)
        let average = total / Double(records.count)
        return average
    }

    func upload(result: Double) async -> String {
        "OK"
    }
    
}
