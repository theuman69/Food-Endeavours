//
//  CurryViewController.swift
//  My Food Endeavours
//
//  Created by Dr Lubna Zaheer yousafi on 14/12/2023.
//

import UIKit

class CurryViewController: UIViewController {

    // Outlets for ingredient switches
    @IBOutlet weak var chickenSwitch: UISwitch!
    @IBOutlet weak var potatoesSwitch: UISwitch!
    @IBOutlet weak var carrotsSwitch: UISwitch!
    @IBOutlet weak var onionsSwitch: UISwitch!
    @IBOutlet weak var curryCubesSwitch: UISwitch!
    
    // Dictionary to track selected ingredients
    var selectedIngredients = [String: Bool]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set all switches to off position
        chickenSwitch.isOn = false
        potatoesSwitch.isOn = false
        carrotsSwitch.isOn = false
        onionsSwitch.isOn = false
        curryCubesSwitch.isOn = false

        // Initialize the dictionary to track selected ingredients
        selectedIngredients = [
            "Chicken": false,
            "Potatoes": false,
            "Carrots": false,
            "Onions": false,
            "Curry Cubes": false
        ]
    }

    
    // Actions for the switches' value changed
    @IBAction func chickenSwitchChanged(_ sender: UISwitch) {
        selectedIngredients["Chicken"] = sender.isOn
    }

    @IBAction func potatoesSwitchChanged(_ sender: UISwitch) {
        selectedIngredients["Potatoes"] = sender.isOn
    }

    @IBAction func carrotsSwitchChanged(_ sender: UISwitch) {
        selectedIngredients["Carrots"] = sender.isOn
    }

    @IBAction func onionsSwitchChanged(_ sender: UISwitch) {
        selectedIngredients["Onions"] = sender.isOn
    }

    @IBAction func curryCubesSwitchChanged(_ sender: UISwitch) {
        selectedIngredients["Curry Cubes"] = sender.isOn
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

// Make sure to have this CartManager code in a separate Swift file or added to your shared code
