//
//  WelcomeViewController.swift
//  Fashionably
//
//  Created by Hrithvik  Alex on 2019-01-13.
//  Copyright © 2019 Hrithvik  Alex. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username.placeholder = "Username"
        password.placeholder = "Password"
    }
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
    }
    

}
