//
//  HomeViewModel.swift
//  AnimatedHeader
//
//  Created by tongbin的mac on 2023/9/8.
//

import Foundation


class HomeViewModel: ObservableObject {
    @Published var offset: CGFloat = 0
    @Published var selectedTab = tabsItems.first!.tab
}
