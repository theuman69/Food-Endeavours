//
//  IngredientCell.swift
//  My Food Endeavours
//
//  Created by Dr Lubna Zaheer yousafi on 13/12/2023.
//

import UIKit

class IngredientCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkboxButton: UIButton!

    var ingredientName: String?

    @IBAction func checkboxTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        // Notify the view controller that the checkbox was tapped.
        // This can be done via a delegate, closure, or notification.
    }

    func configure(with ingredientName: String, isSelected: Bool) {
        self.ingredientName = ingredientName
        nameLabel.text = ingredientName
        checkboxButton.isSelected = isSelected
    }
}
