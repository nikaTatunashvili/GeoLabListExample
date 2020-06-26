//
//  TasksTableViewController.swift
//  List Example
//
//  Created by GL on 6/26/20.
//  Copyright © 2020 GL. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController {

    var dataSource: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "TasksCell")
        dataSource = (1...20).map({ AppGenerator.rendomText(max: $0 + 30) })
        
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNew)), animated: false)
    }
    
    @objc func addNew() {
        showDetail(indexPath: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? TasksCell)?.setTitle(dataSource[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showDetail(indexPath: indexPath)
    }
    
    func showDetail(indexPath: IndexPath?) {
        let vc = TaskDetailViewController()
        
        var task: String? {
            if let indexPath = indexPath {
                return dataSource[indexPath.row]
            }
            return nil
        }
        vc.params = TaskDetailParams(task: task, indexPath: indexPath, completion: { text, path in
            if let path = path {
                self.dataSource[path.row] = text
                self.tableView.reloadRows(at: [path], with: .automatic)
            } else {
                self.dataSource.insert(text, at: 0)
                self.tableView.reloadData()
            }
        })
        if let task = task {
            LocalStorage.addTask(task: task)
            print("Storage Body", LocalStorage.recentTasks)
        }
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
