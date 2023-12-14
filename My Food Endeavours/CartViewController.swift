//
//  CartViewController.swift
//  My Food Endeavours
//
//  Created by Dr Lubna Zaheer yousafi on 14/12/2023.
//
import UIKit

class CartViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var homeAddressTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartManager.shared.cartItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath)
        cell.textLabel?.text = CartManager.shared.cartItems[indexPath.row]
        return cell
    }

    @IBAction func clearCartTapped(_ sender: UIButton) {
        CartManager.shared.clearCart()
        tableView.reloadData()    }
    
    @IBAction func confirmPurchaseTapped(_ sender: UIButton) {
            guard !CartManager.shared.cartItems.isEmpty else {
                presentAlert(withTitle: "Cart is Empty", message: "There are no items in the cart.")
                return
            }

            guard let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty,
                  let homeAddress = homeAddressTextField.text, !homeAddress.isEmpty else {
                presentAlert(withTitle: "Missing Information", message: "Please enter your phone number and home address.")
                return
            }

            // Logic for processing the purchase goes here
            // For now, we'll just clear the cart and show a success message
            CartManager.shared.clearCart()
            tableView.reloadData()
            presentAlert(withTitle: "Purchase Successful", message: "Please check your SMS for order ID.")
        }
        
        private func presentAlert(withTitle title: String, message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true)
        }
    }

