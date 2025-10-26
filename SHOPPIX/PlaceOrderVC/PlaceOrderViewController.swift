//
//  PlaceOrderViewController.swift
//  SHOPPIX
//
//  Created by Nafea Elkassas on 26/10/2025.
//

import UIKit

class PlaceOrderViewController: UIViewController {
       //MARK: - Outlets
    
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var shippingFeesLabel: UILabel!
    @IBOutlet weak var promocodeTextField: UITextField!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var grandTotalLabel: UILabel!
    @IBOutlet weak var placeOrderButton: UIButton!

       //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        placeOrderButton.layer.cornerRadius = placeOrderButton.frame.height / 2
    }
    
       //MARK: - Behaviour
    
    
    
       //MARK: - Actions
    
    @IBAction func placeOrderTapped(_ sender: UIButton) {
    }
    
    
    
}
