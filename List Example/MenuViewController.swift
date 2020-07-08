//
//  MenuViewController.swift
//  List Example
//
//  Created by GL on 6/26/20.
//  Copyright © 2020 GL. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var topConstraint2: NSLayoutConstraint?
    
    @IBAction func tableViewAction() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") else { return }
        showWithModal(vc: vc)
        testAnimation()
    }
    
    @IBAction func tabBarAction() {
        let vc = MainTabViewController()
        showWithModal(vc: vc)
        testAnimation()
    }
    
    private func showWithModal(vc: UIViewController) {
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    lazy var topConstraint3: NSLayoutConstraint = {
        button1.superview!.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 500)
    }()
    func testAnimation() {
//        UIView.animate(withDuration: 0.3, animations: {
//            self.button4.alpha = 0.2
//        }) { finish in
//            UIView.animate(withDuration: 0.3, delay: 3, options: [.autoreverse, .repeat], animations: {
//                self.button4.alpha = 1
//            }, completion: nil)
//        }
        self.topConstraint?.isActive = false
        topConstraint3.isActive.reverse()
        
        
        
//        if let topConstraint2 = topConstraint2 {
//             topConstraint2.isActive.reverse()
//        } else {
//            let top = button1.superview?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 500)
//            top?.isActive = true
//            topConstraint2 = top
//        }
//
//
//
        
        UIView.animate(withDuration: 0.5) {
            
            self.view.layoutIfNeeded()
        }
    }
}
