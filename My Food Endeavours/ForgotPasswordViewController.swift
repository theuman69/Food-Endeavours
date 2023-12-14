//
//  ForgotPasswordViewController.swift
//  My Food Endeavours
//
//  Created by Dr Lubna Zaheer yousafi on 11/12/2023.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup can be done here
    }
    
    // MARK: - IBActions
    @IBAction func proceedButtonTapped(_ sender: UIButton) {
        // Validate the email field
        guard let email = emailTextField.text, !email.isEmpty else {
            presentAlert(withTitle: "Error", message: "Please enter your email.")
            return
        }
        
        // TODO: Implement the logic to handle password reset via email
        sendPasswordResetRequest(email: email)
    }
    
    // MARK: - Password Reset
    private func sendPasswordResetRequest(email: String) {
        // Here you would call your backend API to trigger a password reset for the given email
        print("Password reset request sent for email: \(email)")
        
        // Show a confirmation alert/message to the user
        presentAlert(withTitle: "Check Your Email", message: "We have sent a password reset link to your email.")
    }
    
    // MARK: - Helper Methods
    private func presentAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}
