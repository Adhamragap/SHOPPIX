//
//  HomeViewController.swift
//  SHOPPIX
//
//  Created by Nafea Elkassas on 23/10/2025.
//

import UIKit

class HomeViewController: UIViewController {
       //MARK: - Properties
    let coupon: String = "COUPONTest25percent"
    
   //MARK: - Outlets
    
    @IBOutlet weak var categoriesSearchBar: UISearchBar!
    
    @IBOutlet weak var headerContainerView: UIView!
    
    @IBOutlet weak var couponImageView: UIImageView!
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
       //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        headerContainerView.layer.cornerRadius = headerContainerView.frame.width / 10
        categoriesCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
    }

       //MARK: - Behaviour
     private func copyCouponCode() {
        UIPasteboard.general.string = coupon
        showCopiedAlert()
    }

    private func showCopiedAlert() {
        let alert = UIAlertController(title: "Copied!", message: "Coupon code \(coupon) copied to clipboard.", preferredStyle: .alert)
        present(alert, animated: true)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            alert.dismiss(animated: true)
        }
    }

    
    
    @IBAction func couponTapped(_ sender: UIButton) {
        copyCouponCode()
    }
    
}
extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: categoriesCollectionView.frame.width / 2 - 10, height: categoriesCollectionView.frame.height / 2 - 60)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ProductsViewController(nibName: "ProductsViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
