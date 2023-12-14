//
//  SpaghettiViewController.swift
//  My Food Endeavours
//
//  Created by Dr Lubna Zaheer yousafi on 14/12/2023.
//

import UIKit

class SpaghettiViewController: UIViewController {

    // Outlets for ingredient switches
    @IBOutlet weak var pastaSwitch: UISwitch!
    @IBOutlet weak var MarinaraSwitch: UISwitch!
    @IBOutlet weak var cheeseSwitch: UISwitch!
    @IBOutlet weak var basilSwitch: UISwitch!

    // Dictionary to track selected ingredients
    var selectedIngredients = [String: Bool]()

    override func viewDidLoad() {
            super.viewDidLoad()

            // Set all switches to off position
            pastaSwitch.isOn = false
            MarinaraSwitch.isOn = false
            cheeseSwitch.isOn = false
            basilSwitch.isOn = false

            // Initialize the dictionary to track selected ingredients
            selectedIngredients = [
                "Pasta": false,
                "Tomato Sauce": false,
                "Meatballs": false,
                "Cheese": false,
                "Basil": false
            ]
        }
    // Actions for the switches' value changed
    @IBAction func pastaSwitchChanged(_ sender: UISwitch) {
        selectedIngredients["Pasta"] = sender.isOn
    }

    @IBAction func MarinaraSauceSwitchChanged(_ sender: UISwitch) {
        selectedIngredients["Marinara Sauce"] = sender.isOn
    }


    @IBAction func cheeseSwitchChanged(_ sender: UISwitch) {
        selectedIngredients["Cheese"] = sender.isOn
    }

    @IBAction func basilSwitchChanged(_ sender: UISwitch) {
        selectedIngredients["Basil"] = sender.isOn
    }

    // Action for the "Add to Cart" button
    @IBAction func addToCartButtonTapped(_ sender: UIButton) {
        let selectedItems = selectedIngredients.filter { $0.value }.map { $0.key }
        
        if selectedItems.isEmpty {
            presentAlert(withTitle: "No Item Selected", message: "Please select at least one ingredient.")
        } else {
            CartManager.shared.addItems(items: selectedItems)
            presentAlert(withTitle: "Items Added", message: "Items added to cart successfully.")
        }
    }
    
    private func presentAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true)
    }
}

// Assuming CartManager is defined elsewhere as provided previously
