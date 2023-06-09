//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Eyüp Ensar Pirol on 20.04.2023.
//  Copyright © 2023 Eyüp Ensar Pirol. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func signInClicked(sender: AnyObject) {
        
        let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { (success, error) in
                if success == true {
                    //successful auth
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.myLabel.text = "Error!"
                    }
                }
            }
            
            
        }
        
        
    }
}

