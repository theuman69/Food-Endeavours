//
//  RegisterViewController.swift
//  My Food Endeavours
//
//  Created by Dr Lubna Zaheer yousafi on 11/12/2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Any additional setup can be done here
    }

    // MARK: - IBActions
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        // Check all fields are non-empty
        let fields = [nameTextField, usernameTextField, passwordTextField, emailTextField, confirmPasswordTextField]
        for field in fields {
            if field?.text?.isEmpty ?? true {
                presentAlert(withTitle: "Error", message: "All fields are required.")
                return
            }
        }
        
        // Check passwords match
        if passwordTextField.text != confirmPasswordTextField.text {
            presentAlert(withTitle: "Error", message: "Passwords do not match.")
            return
        }
        
        // If you have server side registration set up, here is where you would call it
        // For now, we'll just print the information and show a success message
        
        if let name = nameTextField.text,
           let username = usernameTextField.text,
           let email = emailTextField.text,
           let password = passwordTextField.text {
            print("Name: \(name), Username: \(username), Email: \(email), Password: \(password)")
            
            // Show success message
            presentAlert(withTitle: "Success", message: "Successfully registered.", completion: {
                self.navigateToLoginViewController()
            })
        }
    }

    // MARK: - Navigation
    private func navigateToLoginViewController() {
        // If you presented this view controller modally, you can simply dismiss it
        // dismiss(animated: true, completion: nil)
        
        // If you pushed this view controller onto a navigation stack, use the following line instead:
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Helper Methods
    private func presentAlert(withTitle title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
