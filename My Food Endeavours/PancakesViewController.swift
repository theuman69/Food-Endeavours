//
//  PancakesViewController.swift
//  My Food Endeavours
//
//  Created by Dr Lubna Zaheer yousafi on 13/12/2023.
//

import UIKit

class PancakesViewController: UIViewController {

    // Outlets for ingredient switches
    @IBOutlet weak var flourSwitch: UISwitch!
    @IBOutlet weak var eggsSwitch: UISwitch!
    @IBOutlet weak var sugarSwitch: UISwitch!
    @IBOutlet weak var butterSwitch: UISwitch!
    @IBOutlet weak var milkSwitch: UISwitch!

    // Dictionary to track selected ingredients
    var selectedIngredients = [String: Bool]()

    override func viewDidLoad() {
            super.viewDidLoad()

            // Set all switches to off position
            flourSwitch.isOn = false
            eggsSwitch.isOn = false
            sugarSwitch.isOn = false
            butterSwitch.isOn = false
            milkSwitch.isOn = false

            // Initialize the dictionary to track selected ingredients
            selectedIngredients = [
                "Flour": false,
                "Eggs": false,
                "Sugar": false,
                "Butter": false,
                "Milk": false
            ]
        }
    
    // Actions for the switches' value changed
    @IBAction func flourSwitchChanged(_ sender: UISwitch) {
        selectedIngredients["Flour"] = sender.isOn
    }

    @IBAction func eggsSwitchChanged(_ sender: UISwitch) {
        selectedIngredients["Eggs"] = sender.isOn
    }

    @IBAction func sugarSwitchChanged(_ sender: UISwitch) {
        selectedIngredients["Sugar"] = sender.isOn
    }

    @IBAction func butterSwitchChanged(_ sender: UISwitch) {
        selectedIngredients["Butter"] = sender.isOn
    }

    @IBAction func milkSwitchChanged(_ sender: UISwitch) {
        selectedIngredients["Milk"] = sender.isOn
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
