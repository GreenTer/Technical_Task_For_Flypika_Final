//
//  ViewController.swift
//  Technical_Task_For_Flypika
//
//  Created by Baravitski Aliaksandr on 25.06.21.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authService = SceneDelegate.shared().authService
    }
    
    @IBAction func signInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
}

