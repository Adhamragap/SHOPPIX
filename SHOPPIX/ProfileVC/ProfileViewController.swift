//
//  ProfileViewController.swift
//  SHOPPIX
//
//  Created by Nafea Elkassas on 27/10/2025.
//

import UIKit

class ProfileViewController: UIViewController {
       //MARK: - Outlets
    
    @IBOutlet weak var welcomeUsernameLabel: UILabel!
    
    @IBOutlet weak var ordersTableView: UITableView!
    
    
       //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupTableView()

    }

       //MARK: - Behaviour
//    func setupTableView(){
//        ordersTableView.delegate = self
//        ordersTableView.dataSource = self
//        ordersTableView.register(UINib(nibName: "OrdersTableViewCell", bundle: nil), forCellReuseIdentifier: "OrdersTableViewCell")
//        
//
//    }
    
    
       //MARK: - Actions
    
    @IBAction func moreOrdersButtonTapped(_ sender: UIButton) {
        print("More orders tapped")
    }
    
    @IBAction func moreWishlistButtonTapped(_ sender: UIButton) {
        print("more wishlist tapped")
    }
    

}

   //MARK: - TableView Methods
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersTableViewCell", for: indexPath) as! OrdersTableViewCell
        return cell
    }
    
    
}
