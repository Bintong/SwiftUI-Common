//
//  MainActorViewModel.swift
//  TaskTest
//
//  Created by tongbin的mac on 2023/11/30.
//

import Foundation

@MainActor
class MainActorViewModel:ObservableObject {
 
   @Published var change: [Int] = []
    func main_updateNumber(_ newNum: Int ) {
        self.change.append(1)
        Task {
            await testAction2()
        }
    }
    
    func main_remove() {
        self.change.removeLast()
        self.change.removeLast()
        Task {
            await removeAsync()
        }
    }
    // 操作数据的时候需要隔离访问
    // 但是 如果非 操作，仅仅read。不需要隔离访问
    
    nonisolated func buildNet() async  {
        print("nonisolated")
    }
    private func testAction2() async {
        let records = await fetchWeatherHistory() // 需要用的你回掉的时候 才用async
        let average = await calculateAverageTemperature(for: records)
        let response = await upload(result: average)
        try!await Task.sleep(seconds:  1.5)
        await MainActor.run {
            self.change.append(1)
            self.change.append(1)
            self.change.append(1)
        }
        print("Server response: \(response)")
    }
    
    
    private func removeAsync() async {
        let records = await fetchWeatherHistory() // 需要用的你回掉的时候 才用async
        let average = await calculateAverageTemperature(for: records)
        let response = await upload(result: average)
        try!await Task.sleep(seconds:  1.5)
        let t = await MainActor.run {
            self.change.removeLast()
        }
         print("remove \(response) ----- \(t)")
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
