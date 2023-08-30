//
//  Crop.swift
//  iOSAsyncTest2
//
//  Created by tongbin的mac on 2023/8/27.
//

import Foundation


enum Crop: Equatable {
    case circle
    case rectangle
    case square
    case custom(CGSize)
    
    func name()->String {
        
        switch self  {
        case .circle:
            return "Circle"
        case .rectangle:
            return "Rectangle"
        case .square:
            return "Square"
        case let .custom(cg):
            return "Custom\(Int(cg.width))X\(Int(cg.height))"
        }
        
    }
        
        
    func size() -> CGSize {
        switch self {
        case .circle:
            return .init(width: 300, height: 300)
        case .rectangle:
            return .init(width: 300, height: 300)
        case .square:
            return .init(width: 300,  height: 300)
        case .custom(let cgszie):
            return cgszie
        }
        
    }
}
