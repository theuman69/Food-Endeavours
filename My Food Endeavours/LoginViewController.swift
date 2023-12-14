//
//  LoginViewController.swift
//  My Food Endeavours
//
//  Created by Dr Lubna Zaheer yousafi on 11/12/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
           }
    
    // MARK: - IBActions
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // Validate input fields
        guard validateInputFields() else { return }
        
        // Attempt to authenticate user
        if let username = usernameTextField.text, let password = passwordTextField.text {
            authenticateUser(username: username, password: password)
        }
    }

    @IBAction func registerButtonTapped(_ sender: UIButton) {
        // Navigate to the RegisterViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let registerVC = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            self.navigationController?.pushViewController(registerVC, animated: true)
        }
    }

    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let forgotPasswordVC = storyboard.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as? ForgotPasswordViewController {
            self.navigationController?.pushViewController(forgotPasswordVC, animated: true)
        }
    }

    // MARK: - Helper Methods
    private func validateInputFields() -> Bool {
        guard let username = usernameTextField.text, !username.isEmpty else {
            presentAlert(withTitle: "Missing Information", message: "Please enter your username.")
            return false
        }

        guard let password = passwordTextField.text, !password.isEmpty else {
            presentAlert(withTitle: "Missing Information", message: "Please enter your password.")
            return false
        }
        
        return true
    }
    
    private func authenticateUser(username: String, password: String) {
        // Placeholder for authentication logic
        print("Attempting to authenticate user")
        
        // Simulate network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            let success = true // Simulated response from server
            
            if success {
                // Present an alert for successful authentication
                let alertController = UIAlertController(title: "Login Success", message: "You have successfully logged in.", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default) { _ in
                    // Navigate to HomeViewController after dismissing the alert
                    self?.navigateToHomeViewController()
                })
                self?.present(alertController, animated: true)
            } else {
                // Handle failed authentication
                self?.presentAlert(withTitle: "Login Failed", message: "Incorrect username or password.")
            }
        }
    }
    
    private func navigateToHomeViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            // Set HomeViewController as the root view controller to prevent going back
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = homeVC
                window.makeKeyAndVisible()
            }
        }
    }
    
    private func presentAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true)
    }
}
