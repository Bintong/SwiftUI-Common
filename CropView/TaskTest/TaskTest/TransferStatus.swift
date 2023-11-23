//
//  TransferStatus.swift
//  TaskTest
//
//  Created by tongbin的mac on 2023/11/21.
//

import Foundation

enum TransferStatus:Int32,CustomStringConvertible {
    case wait = 0x00
    case pause = 0x01
    case running = 0x02
    case finished = 0x03
    case error = 0x04
    case retry = 0x05
    
    case pausing = 0x10
    case deleting = 0x11
    
    var description: String {
        switch self {
        case .wait: return "wait"
        case .pause: return "pause"
        case .running: return "running"
        case .finished: return "finished"
        case .error: return "error"
        case .retry: return "retry"
        case .pausing: return "pausing"
        case .deleting: return "deleting"
        }
    }
    
    var isRunning:Bool {
        switch self {
        case .running, .wait, .retry :
            return true
        default:
            return false
        }
    }

}
