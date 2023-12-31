//
//  ContentView1.swift
//  TaskTest
//
//  Created by tongbin的mac on 2023/11/16.
//

import SwiftUI
 
// 所有的running task 在 array 里面 - 这个要改为 actor
// 这个running 不是真的running 是除了未完成的各种状态
// 需要两个变量1 循环的次数
// 2 每次拿出的三个任务running 状态的 去下载


struct ContentView1: View {
    
    @ObservedObject var actorViewModel:TransFerActorActionViewModel
    @ObservedObject var mainactorViewModel:MainActorViewModel
    init(actorViewModel: TransFerActorActionViewModel,mainactorViewModel:MainActorViewModel) {
        self.actorViewModel = actorViewModel
        self.mainactorViewModel = mainactorViewModel
    }
    
    var body: some View {
        VStack {
            HStack{
                Button {
                    mainactorViewModel.isRunning = true
                    mainactorViewModel.taskTestFunc()
                } label: {
                    Text("开始全部")
                }
                Button {
                    mainactorViewModel.isRunning = false
                } label: {
                    Text("暂停全部")
                }
                
            }
            
            
            HStack{
                Button {
                    Task {
                        await actorViewModel.testAction()
                        actorViewModel.updateNumber(1)
                    }
                } label: {
                    Text("Actor \(actorViewModel.change ) | ")
                }
                Button {
                    mainactorViewModel.main_updateNumber(1)
                } label: {
                    Text("MainActor \(mainactorViewModel.change.count)")
                }
                Button {
                    mainactorViewModel.main_remove()
                } label: {
                    Text("Remove")
                }
                
                Button {
                    Task {
                        await mainactorViewModel.buildNet()
                    }
                    
                } label: {
                    Text("nonisolated")
                }
                
            }
        }
        
        List {
            Section {
                ForEach(self.mainactorViewModel.unFinishModels) {model in
                    taskRow(model:model)
                        .id(model.id)

                }
            } header: {
                Text(" 未完成 任务 \(self.mainactorViewModel.unFinishModels.count)")
            }
            Section {
                ForEach(self.mainactorViewModel.finishModels) {model in
                    taskRow(model:model)
                        .id(model.id)
                }
            } header: {
                Text(" 已经完成 任务 \(self.mainactorViewModel.finishModels.count)")
            }
        }
        .onAppear {
            self.mainactorViewModel.loadDb()
            
        }
    }
    
    
    
    @ViewBuilder
   func taskRow(model:TransferModel) -> some View {
        HStack {
            Text("\(model.fileName)")
            Spacer()
            Text("\(model.transStatus.description) .... \(model.progressUpLoad)")
        }
    }
    
    
    
/*
    task test

    func accountWithdraw1()async {
        
        await a1.withdraw(amount: 1)
        print("------1>  \(await a1.balanceConfig())")
        
        self.count = await a1.balanceConfig()
        try!await Task.sleep(seconds: 0.1)
        
        
    }
    
    func accountWithdraw2()async {
        
        await a1.withdraw(amount: 1)
        print("------2>  \(await a1.balanceConfig())")
        self.count = await a1.balanceConfig()
        try!await Task.sleep(seconds: 0.2)
        
        
    }
    func accountWithdraw3()async {
        
        await a1.withdraw(amount: 1)
        print("------3>  \(await a1.balanceConfig())")
        self.count = await a1.balanceConfig()
        try!await Task.sleep(seconds: 0.2)
        
        
    }
    
    
    func transfer(amount: Int, from: BankAccount, to: BankAccount) async throws {
        let available = await from.withdraw(amount: amount)
        await to.deposit(amount: available)
    }
    
    let account1 = BankAccount(initialBalance: 100)
    let account2 = BankAccount(initialBalance: 50)
    
    
    func update() async {
        Task {
            try await transfer(amount: 75, from: account2, to: account1)
            print("Transfer complete :: account2 => account1: 75 ")
        }
        
        Task {
            try await transfer(amount: 50, from: account1, to: account2)
            print("Transfer complete :: account1 => account2 : 50 ")
        }
    }
    
    func config() async {
        Task {
            let balance1 = await account1.balanceConfig() // actor method
            let balance2 = await account2.balanceConfig() // actor method
            
            print("account1 balance1 = \(balance1) , account2 balance2 = \(balance2)")
        }
    }
    
 */
    
}



extension Task where Success == Never, Failure == Never {
    static func sleep(seconds: Double) async throws {
        let duration = UInt64(seconds * 1_000_000_000)
        try await Task.sleep(nanoseconds: duration)
    }
}

#Preview {
    
    ContentView1(actorViewModel: TransFerActorActionViewModel(),mainactorViewModel: MainActorViewModel())
}
