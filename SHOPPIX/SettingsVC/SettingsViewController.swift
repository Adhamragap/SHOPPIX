//
//  SettingsViewController.swift
//  SHOPPIX
//
//  Created by Nafea Elkassas on 29/10/2025.
//

import UIKit

class SettingsViewController: UIViewController {
       //MARK: - Outlets
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var addressStackView: UIStackView!
    
    @IBOutlet weak var currencyStackView: UIStackView!
    
    @IBOutlet weak var contactUsStackView: UIStackView!
    
    @IBOutlet weak var aboutUsStackView: UIStackView!
    
    @IBOutlet weak var logoutButton: UIButton!
    
       //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.layer.cornerRadius = logoutButton.frame.height / 2
        tabBarController?.tabBar.isHidden = true
        setupGestures()

    }
    
       //MARK: - Behaviour
    private func setupGestures() {
        addressStackView.isUserInteractionEnabled = true
        currencyStackView.isUserInteractionEnabled = true
        contactUsStackView.isUserInteractionEnabled = true
        aboutUsStackView.isUserInteractionEnabled = true
        
        let addressTap = UITapGestureRecognizer(target: self, action: #selector(addressTapped))
        let currencyTap = UITapGestureRecognizer(target: self, action: #selector(currencyTapped))
        let contactTap = UITapGestureRecognizer(target: self, action: #selector(contactUsTapped))
        let aboutUsTap = UITapGestureRecognizer(target: self, action: #selector(aboutUsTapped))
        addressStackView.addGestureRecognizer(addressTap)
        currencyStackView.addGestureRecognizer(currencyTap)
        contactUsStackView.addGestureRecognizer(contactTap)
        aboutUsStackView.addGestureRecognizer(aboutUsTap)
        
    }

       //MARK: - Actions
    @objc private func addressTapped() {
        let addressVC = AddressViewController(nibName: "AddressViewController", bundle: nil)
        navigationController?.pushViewController(addressVC, animated: true)
    }
    @objc private func currencyTapped() {
        print("Currency Stack Tapped")
    }
    @objc private func contactUsTapped() {
        let contactUsVC = ContactUsViewController(nibName: "ContactUsViewController", bundle: nil)
        navigationController?.pushViewController(contactUsVC, animated: true)
    }
    @objc private func aboutUsTapped() {
        let aboutUsVC = AboutUsViewController(nibName: "AboutUsViewController", bundle: nil)
        navigationController?.pushViewController(aboutUsVC, animated: true)
    }
    
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        print("Logout button tapped")
    }
}
