//
//  TaskDetailViewController.swift
//  List Example
//
//  Created by GL on 6/26/20.
//  Copyright © 2020 GL. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    var params: TaskDetailParams?
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = params?.task
        
        let button = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveAction))
        self.navigationItem.setRightBarButton(button, animated: false)
        
    }
    
    @objc func saveAction() {
        if let text = textView.text, !text.isEmpty {
            params?.completion?(text, params?.indexPath)
        }
        self.navigationController?.popViewController(animated: true)
    }
}

struct TaskDetailParams {
    let task: String?
    let indexPath: IndexPath?
    let completion: ((_ task: String, _ indexPath: IndexPath?) -> Void)?
}
