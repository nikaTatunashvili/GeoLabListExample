//
//  MenuViewController.swift
//  List Example
//
//  Created by GL on 6/26/20.
//  Copyright © 2020 GL. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBAction func tableViewAction() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") else { return }
        showWithModal(vc: vc)
    }
    
    @IBAction func tabBarAction() {
        let vc = MainTabViewController()
        showWithModal(vc: vc)
    }
    
    private func showWithModal(vc: UIViewController) {
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
}
