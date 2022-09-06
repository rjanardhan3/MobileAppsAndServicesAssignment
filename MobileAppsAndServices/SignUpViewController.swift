//
//  SignUpViewController.swift
//  MobileAppsAndServices
//
//  Created by Raj Janardhan on 9/5/22.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender: Any) {
        if (passwordTF.text == "") {
            let alert = UIAlertController(title: "You can't leave your password empty", message: "Please enter a password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(alert, animated: true)
        } else if (usernameTF.text == "") {
            let alert = UIAlertController(title: "You can't leave your username empty", message: "Please enter a username", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(alert, animated: true)
        } else if (passwordTF.text!.count < 6) {
            let alert = UIAlertController(title: "Your password has to be at least 6 characters", message: "Please enter a valid password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else {
            Auth.auth().createUser(withEmail: usernameTF.text!, password: passwordTF.text!) { authResult, error in
                if (error != nil){
                    let alert = UIAlertController(title: "There was an error signing up", message: "Please sign up again", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler:nil))
                    self.present(alert, animated:true)
                } else {
                    self.performSegue(withIdentifier: "moveFromSignUpSegue", sender: self)
                }
                //print(authResult)
            }
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
