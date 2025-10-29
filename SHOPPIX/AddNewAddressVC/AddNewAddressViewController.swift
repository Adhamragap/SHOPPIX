//
//  AddNewAddressViewController.swift
//  SHOPPIX
//
//  Created by Nafea Elkassas on 29/10/2025.
//

import UIKit

class AddNewAddressViewController: UIViewController {
       //MARK: - Outlets
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var addAddressButton: UIButton!
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addAddressButton.layer.cornerRadius = addAddressButton.frame.height / 2
        tabBarController?.tabBar.isHidden = true
    }



}
