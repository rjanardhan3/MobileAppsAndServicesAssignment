//
//  ViewController.swift
//  MobileAppsAndServices
//
//  Created by Raj Janardhan on 9/5/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func login(_ sender: Any) {
        var check = false
        if (passwordTF.text == "") {
            let alert = UIAlertController(title: "You can't leave your password empty", message: "Please enter a password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(alert, animated: true)
        } else if (usernameTF.text == "") {
            let alert = UIAlertController(title: "You can't leave your username empty", message: "Please enter a username", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(alert, animated: true)
        } else {
            Auth.auth().signIn(withEmail: usernameTF.text!, password: passwordTF.text!) { [weak self] authResult, error in
              guard let strongSelf = self else {
                  
                  //print(strongSelf)
                  return
              }
                if (authResult != nil) {
                    self!.performSegue(withIdentifier: "moveFromLogin", sender: self)
                } else {
                    let alert = UIAlertController(title: "You have an incorrect username and/or password", message: "Please try again.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil))
                    self?.present(alert, animated: true)
                    
                }
                
                
              // ...
            }
            
        }
        
    }
}

