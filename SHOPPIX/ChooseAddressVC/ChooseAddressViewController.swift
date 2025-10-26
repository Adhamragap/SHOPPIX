//
//  ChooseAddressViewController.swift
//  SHOPPIX
//
//  Created by Nafea Elkassas on 26/10/2025.
//

import UIKit

class ChooseAddressViewController: UIViewController {
   //MARK: - Outlets
    
    @IBOutlet weak var addressesTableVIew: UITableView!
    @IBOutlet weak var continueToPaymentButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueToPaymentButton.layer.cornerRadius = continueToPaymentButton.frame.height / 2
        setupTableView()
    }
    
       //MARK: - Behaviour
    func setupTableView(){
        addressesTableVIew.delegate = self
        addressesTableVIew.dataSource = self
        addressesTableVIew.register(UINib(nibName: "AddressTableViewCell", bundle: nil), forCellReuseIdentifier: "AddressTableViewCell")
    }

}
extension ChooseAddressViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addressesTableVIew.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as! AddressTableViewCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    
}
