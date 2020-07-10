//
//  RegisterViewController.swift
//  List Example
//
//  Created by GL on 7/10/20.
//  Copyright © 2020 GL. All rights reserved.
//

import UIKit
import Firebase
class RegisterViewController: UIViewController {

    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func register() {
        guard let mail = mailField.text?.notEmpty,
            let password = passwordField.text?.notEmpty else {
            return
        }
//        Auth.auth().createUser(withEmail: mail, password: password) { authResult, error in
//            print(authResult)
//
//            if error == nil {
//                self.dismiss(animated: true, completion: nil)
//            }
//        }
        Auth.auth().signIn(withEmail: mail, password: password) { [weak self] authResult, error in

//          guard let self = self else { return }
          
            if error == nil {
                self?.dismiss(animated: true, completion: nil)
            }
        }
        
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        
        changeRequest?.commitChanges { (error) in
          // ...
        }
    }

}


extension String {
    var notEmpty: String? {
        if self.isEmpty { return nil }
        return self
    }
}
