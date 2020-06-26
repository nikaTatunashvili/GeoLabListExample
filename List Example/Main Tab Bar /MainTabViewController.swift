//
//  MainTabViewController.swift
//  List Example
//
//  Created by GL on 6/26/20.
//  Copyright © 2020 GL. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.delegate = self
        self.viewControllers = generateViewControllers()
        
    }

    private func generateViewControllers() -> [UIViewController] {
        let tasks = TasksTableViewController()
        tasks.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        
        
        let three = UIViewController()
        three.view.backgroundColor = UIColor(white: .random(in: 0...1), alpha: 1.0)
        three.tabBarItem = tabBarItem(2)
        
        let four = UIViewController()
        four.view.backgroundColor = UIColor(white: .random(in: 0...1), alpha: 1.0)
        four.tabBarItem = tabBarItem(3)
        return [tasks, three, four]
    }
    
    private func tabBarItem(_ index: Int) -> UITabBarItem {
        UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem(rawValue: index + 3) ?? .more, tag: index)
    }
}

extension MainTabViewController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(#function)
    }
}
