//
//  DataViewController.swift
//  MobileAppsAndServices
//
//  Created by Raj Janardhan on 9/5/22.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var pigLatinText: UILabel!
    @IBOutlet weak var pigLatinTF: UITextField!
    @IBOutlet weak var labelCounter: UILabel!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func translateButton(_ sender: Any) {
        if (pigLatinTF.text == "") {
            let alert = UIAlertController(title: "You need to have a message in your text field for the funky translator", message: "Please input in the textfield", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        } else {
            pigLatinText.text = "wow" + pigLatinTF.text! + "ay"
        }
        
    }
    
    @IBAction func updateButton(_ sender: Any) {
        count += 1
        labelCounter.text = String(count)
        if (count % 9 == 0) {
            let alert = UIAlertController(title: "The counter is divisible by 9", message: "Just some cool information", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        pigLatinText.text = "WOW! THIS CHANGED BECAUSE THE COUNT IS DIVISIBLE BY 9. DID YOU KNOW THAT IF THE SUM OF THE DIGITS OF A NUMBER ARE DIVISIBLE BY 9, THE NUMBER ITSELF IS DIVIDED BY 9?"
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
