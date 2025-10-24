//
//  ProductCollectionViewCell.swift
//  SHOPPIX
//
//  Created by adham ragap on 23/10/2025.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var favoriteButtonOutlet: UIButton!
    @IBOutlet weak var productStack: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favoriteButtonOutlet.tintColor = UIColor(named: "mainColor")
        productStack.layer.borderWidth = 1
        productStack.layer.cornerRadius = productStack.frame.height / 6
        productStack.layer.borderColor = UIColor(named: "mainColor")?.cgColor
    }

}
