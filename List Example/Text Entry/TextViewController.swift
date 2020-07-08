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
    
    @IBOutlet weak var animateView: UIView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = initialText
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addRendomSubViews()
    }
    
    func addRendomSubViews() {
        let width = view.bounds.width * 0.4
        let height = view.bounds.height * 0.4
//        let x = (view.bounds.width - width) / 2
//        let y = (view.bounds.height - height) / 2
//        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        
        let tempView = UIView() // UIView(frame: rect)
//        tempView.bounds.size = CGSize(width: width, height: height)
        tempView.backgroundColor = .red
        self.view.addSubview(tempView)
        tempView.center = view.center
        
        tempView.translatesAutoresizingMaskIntoConstraints = false
        tempView.heightAnchor.constraint(equalToConstant: height).isActive = true
//        tempView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        let widthConstraint = tempView.widthAnchor.constraint(equalToConstant: width)
        let centerX = tempView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 40)
        let centerY = tempView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        NSLayoutConstraint.activate([widthConstraint, centerX, centerY])
        
    }

    @IBAction func save() {
//        self.dismiss(animated: true, completion: {
//            self.delegate?.textViewController(didChange: self.textView.text)
//        })
        animateView.translatesAutoresizingMaskIntoConstraints = true
        UIView.animate(withDuration: 0.5) {
            self.animateView.center = self.view.center
            self.animateView.frame.origin.x = 150
            self.animateView.frame.origin.y = 300
            self.animateView.frame.size.height = 190
            self.animateView.frame.size.width = 30
        }
    }
}

protocol TextViewControllerDelegate {
    func textViewController(didChange text: String)
}
