//
//  RecentTasksTableViewController.swift
//  List Example
//
//  Created by GL on 6/26/20.
//  Copyright © 2020 GL. All rights reserved.
//

import UIKit

class RecentTasksTableViewController: UITableViewController {
    
    var dataSource: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "TasksCell")
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource = LocalStorage.recentTasks
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? TasksCell)?.setTitle(dataSource[indexPath.row])
    }
}
