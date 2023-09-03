//
//  Task.swift
//  DragAndDropLists
//
//  Created by tongbin的mac on 2023/9/3.
//

 
import SwiftUI

struct Task: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var status: Status
}

enum Status {
    case todo
    case working
    case completed
    
}
