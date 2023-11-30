//
//  TransFerModel.swift
//  TaskTest
//
//  Created by tongbin的mac on 2023/11/21.
//

import Foundation
import SwiftUI
 
class TransferModel: Hashable, Identifiable,Equatable{
    static func == (lhs: TransferModel, rhs: TransferModel) -> Bool {
        return lhs.id == rhs.id &&
        lhs.transStatus == rhs.transStatus
    }
    
    //Hashable协议，自己实现，只判断MD5
   func hash(into hasher: inout Hasher) {
        hasher.combine(id)
       hasher.combine(transStatus)
    }
    
    
    
    var fileName: String
    var transStatus: TransferStatus
     
    var progressUpLoad :Int64 = 0
    
    let id = UUID()
    init(fileName: String, transStatus: TransferStatus) {
        self.fileName = fileName
        self.transStatus = transStatus
    }
    
    
    func changeStateToWait() {
        self.transStatus = .wait
    }
    
    func changeState(state: TransferStatus) {
        self.transStatus = state
    }
    

    func changeStateRunning() {
        self.transStatus = .running
    }
    

    
    
    
    
    
    
    
}
