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
    var isSearching: Bool = false

    // Title view properties to allow updates on rotation / layout changes
    private var titleContainer: UIView?
    private var titleLabelView: UILabel?

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
        navigationItem.hidesBackButton = true
        
        setupnavBar()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // Recalculate the title container width to handle rotations and size class changes.
        guard let container = titleContainer else { return }

        let screenWidth = view.bounds.width
        // Reserve ~160pt for left/right bar button items (adjustable if your buttons change).
        let containerWidth = max(100, screenWidth - 160)
        let containerHeight: CGFloat = 44

        // Update frame and ensure subviews layout
        container.frame = CGRect(x: 0, y: 0, width: containerWidth, height: containerHeight)
        container.setNeedsLayout()
        container.layoutIfNeeded()
        navigationItem.titleView = container
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
    
    func setupnavBar(){
        navigationItem.title = "Home"

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: #selector(searchTapped) )
       
        let cartButton = UIBarButtonItem(
            image: UIImage(systemName: "cart"),
            style: .plain,
            target: self,
            action: #selector(cartTapped)
        )
        
        let favoriteButton = UIBarButtonItem(
            image: UIImage(systemName: "heart"),
            style: .plain,
            target: self,
            action: #selector(favoriteTapped)
        )
        
        if #available(iOS 16.0, *) {
                navigationItem.trailingItemGroups = [
                    UIBarButtonItemGroup(barButtonItems: [cartButton, favoriteButton], representativeItem: nil)
                ]
            } else {
                navigationItem.rightBarButtonItems = [favoriteButton, cartButton]
            }
    }
    
   @objc func searchTapped(){
        isSearching.toggle()
        if isSearching {
            categoriesSearchBar.isHidden = false
        } else {
            categoriesSearchBar.isHidden = true
        }
    }
    
    @objc func cartTapped() {
        let cartVC = ShoppingCartViewController(nibName: "ShoppingCartViewController", bundle: nil)
        navigationController?.pushViewController(cartVC, animated: true)
    }

    @objc func favoriteTapped() {
        print("Favorite tapped")
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
