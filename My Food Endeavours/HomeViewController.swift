//
//  HomeViewController.swift
//  My Food Endeavours
//
//  Created by Dr Lubna Zaheer yousafi on 13/12/2023.
//
import UIKit

class HomeViewController: UIViewController {

    // Assume you have a UIButton for logout in your storyboard
    @IBOutlet weak var logoutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Any additional setup after loading the view
    }

    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        // Display the logout successful message
        let alertController = UIAlertController(title: "Logged Out", message: "Logged out successfully.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            // Navigate to LoginViewController after acknowledging the message
            self?.navigateToLoginViewController()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }

    private func navigateToLoginViewController() {
        // Assuming you have a storyboard named 'Main' and a LoginViewController with storyboard ID 'LoginViewController'
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            // If using a navigation controller
            if let navigationController = self.navigationController {
                // Replace the current view controller stack with the login view controller
                navigationController.setViewControllers([loginViewController], animated: true)
            } else {
                // If not using a navigation controller, reset the window's root view controller
                UIApplication.shared.windows.first?.rootViewController = loginViewController
                UIApplication.shared.windows.first?.makeKeyAndVisible()
            }
        }
    }
}
