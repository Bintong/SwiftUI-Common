//
//  MainActorViewModel.swift
//  TaskTest
//
//  Created by tongbin的mac on 2023/11/30.
//

import Foundation
import SwiftUI

@MainActor
class MainActorViewModel:ObservableObject {
    
    @Published var change: [Int] = []
    @Published var isRunning: Bool = false
    
    @Published var unFinishModels: [TransferModel] = []
    @Published var finishModels: [TransferModel] = []
    
    var taskTest: Task<Void,Never>?
    
    var actorModel:TransFerActorModel?
    var timeObserve: DispatchSourceTimer! //定时任务
    init() {
        
    }
    
    func loadDb() {
        var models:[TransferModel] = []
        for i in 0..<10000 {
            let item = TransferModel(fileName: "第-->\(i)个任务", transStatus: .pause)
            models.append(item)
        }
        self.unFinishModels = models
        self.actorModel = TransFerActorModel(initialTransferModels: models)
    }
    
    
    func taskTestFunc() {
        taskTest = Task(priority: .background) {
            defer {
                taskTest = nil
            }
            while self.isRunning {
                
                await withTaskGroup(of:Void.self) { group in
                    
                    group.addTask {
                        await self.donwloadTask()
                    }
                    group.addTask {
                        await self.donwloadTask()
                    }
                    group.addTask {
                        await self.donwloadTask()
                    }
                    
                    
                    unFinishModels = await self.actorModel!.datasUnFinish()
                    finishModels = await self.actorModel!.datasFinished()
                    
                }
                
                if unFinishModels.count == 0 {
                    break
                }
                
                print("3 finish")
            }
            await Task.yield()
        }
    }
    
    func htcp(_ model: TransferModel)  async   {
        
        unFinishModels = await self.actorModel!.datasUnFinish()
        let unFinishModels = self.unFinishModels
        try!await Task.sleep(seconds: 0.2)
        
        
        await MainActor.run  {
            unFinishModels[model].progressUpLoad =  1
            self.unFinishModels = unFinishModels
        }
        
        
        try!await Task.sleep(seconds: 0.2)
        
        await MainActor.run  {
            unFinishModels[model].progressUpLoad =  2
            self.unFinishModels = unFinishModels
        }
        try!await Task.sleep(seconds: 0.2)
        
        await MainActor.run  {
            unFinishModels[model].progressUpLoad =  3
            self.unFinishModels = unFinishModels
        }
        try!await Task.sleep(seconds: 0.2)
        
        await MainActor.run  {
            unFinishModels[model].progressUpLoad =  4
            self.unFinishModels = unFinishModels
        }
        await self.actorModel?.changeOnStateFinish(model)
        
        
        finishModels = await self.actorModel!.datasFinished()
        
        
        
    }
    //MARK: 数据问题
    func donwloadTask() async  {
        if let model = await self.actorModel?.pickOneUnRunning() {
            await  htcp(model)
        }
    }
    
    // test
    
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
    
    
    
    //
    
    
    //MARK:  GCD定时器倒计时
    ///
    /// - Parameters:
    ///   - timeInterval: 间隔时间
    ///   - repeatCount: 重复次数
    ///   - handler: 循环事件,闭包参数: 1.timer 2.剩余执行次数
    func dispatchTimer(timeInterval: Double, repeatCount: Int, handler: @escaping (DispatchSourceTimer?, Int) -> Void) {
        
        if repeatCount <= 0 {
            return
        }
        if timeObserve != nil {
            timeObserve.cancel()//销毁旧的
        }
        // 初始化DispatchSourceTimer前先销毁旧的，否则会存在多个倒计时
        let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
        timeObserve = timer
        var count = repeatCount
        timer.schedule(deadline: .now(), repeating: timeInterval)
        timer.setEventHandler {
            count -= 1
            DispatchQueue.main.async {
                handler(timer, count)
            }
            if count == 0 {
                timer.cancel()
            }
        }
        timer.resume()
        
    }
}
