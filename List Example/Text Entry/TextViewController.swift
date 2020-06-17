//
//  TextViewController.swift
//  List Example
//
//  Created by GL on 6/17/20.
//  Copyright © 2020 GL. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    var delegate: TextViewControllerDelegate?
    var initialText: String = ""
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = initialText
        // Do any additional setup after loading the view.
    }

    @IBAction func save() {
        self.dismiss(animated: true, completion: {
            self.delegate?.textViewController(didChange: self.textView.text)
        })
    }
}

protocol TextViewControllerDelegate {
    func textViewController(didChange text: String)
}
