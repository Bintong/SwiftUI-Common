//
//  TransFerActorModel.swift
//  TaskTest
//
//  Created by tongbin的mac on 2023/11/21.
//

import Foundation
import SwiftUI

actor TransFerActorModel:ObservableObject {
    // 控制数量
    var taskTest: Task<Void,Never>?  
    var unFinishtransferModels: [TransferModel]
    var finishedMdoels:[TransferModel] = [] // 不知道为啥要如此
    
    init(initialTransferModels: [TransferModel]) {
        unFinishtransferModels = initialTransferModels
    }
    
    func appendTransfor(transforModel: TransferModel) {
        self.unFinishtransferModels.append(transforModel)
    }
    
    func subcripTransfor(transforModel: TransferModel) {
        self.unFinishtransferModels.remove(transforModel)
    }
    
    func pickOneUnRunning() -> TransferModel? {
        guard let m = unFinishtransferModels.filter({$0.transStatus == .pause}).first else { return nil }
        m.transStatus = .running
       return m
    }
 
    
    func changeToRunning(_ model: TransferModel) {
        unFinishtransferModels[model].transStatus = .running
    }
    
    
    func changeOnStateFinish(_ model: TransferModel) {
        unFinishtransferModels.remove(model) //先remvoe 

        unFinishtransferModels[model].transStatus = .finished
        finishedMdoels.append(model)
        print("finish task is \(model.fileName)")

    }
    

    func datasUnFinish() -> [TransferModel] {
        return self.unFinishtransferModels
    }
    
    func datasFinished() -> [TransferModel] {
        return self.finishedMdoels
    }
    
    func datasFinishedCount() -> Int {
        return self.finishedMdoels.count
    }
 
    
    
}



 
extension Collection where Element: Identifiable {
    func index(matching element: Element) -> Self.Index? {
        firstIndex(where: { $0.id == element.id })
    }
    
}


extension RangeReplaceableCollection where Element: Identifiable {
    mutating func remove(_ element: Element) {
        if let index = index(matching: element) {
            remove(at: index)
        }
    }

    subscript(_ element: Element) -> Element {
        get {
            if let index = index(matching: element) {
                return self[index]
            } else {
                return element
            }
        }
        set {
            if let index = index(matching: element) {
                replaceSubrange(index...index, with: [newValue])
            }
        }
    }
}
