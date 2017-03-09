//
//  LoginViewController.swift
//  MyInstagram
//
//  Created by Hung Do on 3/5/17.
//  Copyright © 2017 Hung Do. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: userNameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
            if user != nil {
                print("you are logged in")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = userNameField.text
        newUser.password = passwordField.text
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                print("created user")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)

            } else {
                print("failed user create")
                if error?._code == 202 {
                    print("Username already has been taken")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundView.backgroundColor = UIColor(patternImage: UIImage(named: "instaback")!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
