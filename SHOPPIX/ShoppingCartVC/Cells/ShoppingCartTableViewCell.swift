//
//  ShoppingCartTableViewCell.swift
//  SHOPPIX
//
//  Created by Nafea Elkassas on 25/10/2025.
//

import UIKit

class ShoppingCartTableViewCell: UITableViewCell {
       //MARK: - Properties
    var itemQuantity: Int = 0
    var pricePerItem: Double = 0
    
    
       //MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var brandNameLabel: UILabel!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var priceContainerView: UIView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        numberOfItemsLabel.text = "\(itemQuantity)"
        priceLabel.text = String(format: "%.2f", pricePerItem)
        priceContainerView.layer.borderWidth = 1
        priceContainerView.layer.borderColor = UIColor.systemGray4.cgColor

    }
    override func layoutSubviews() {
        super.layoutSubviews()
        priceContainerView.layer.cornerRadius = priceContainerView.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
       //MARK: - Behaviour
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        if itemQuantity > 0 {
            itemQuantity -= 1
            numberOfItemsLabel.text = "\(itemQuantity)"
            
        } else {
            itemQuantity = 0
        }
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        itemQuantity += 1
        numberOfItemsLabel.text = "\(itemQuantity)"
    }
}
