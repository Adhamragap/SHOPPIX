//
//  ProductsViewController.swift
//  SHOPPIX
//
//  Created by adham ragap on 23/10/2025.
//

import UIKit

class ProductsViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var productCollectionView: UICollectionView!
    private var selectedFilter = ""
    var searchHidden = true
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.isHidden = searchHidden
        title = "Products"
        setUPCollectionView()
      
        setupMenu()
        let searchButton = UIBarButtonItem(
                barButtonSystemItem: .search,
                target: self,
                action: #selector(didTapSearch)
            )
        searchButton.tintColor = UIColor(named: "mainColor")
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItems = [searchButton]
    }
    private func setUPCollectionView (){
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
    }
    private func setupMenu() {
        let allAction = UIAction(title: "All", state: selectedFilter == "All" ? .on : .off) { [weak self] action in
           
                 //   self?.selectedFilter = "All"
                    self?.applyFilter()
                    self?.setupMenu()
                }
                let shoesAction = UIAction(title: "shoes", state: selectedFilter == "shoes" ? .on : .off) { [weak self] action in
                  //  self?.selectedFilter = "shoes"
                    self?.applyFilter(type: "shoes")
                    self?.setupMenu()
                }
        let bagsAction = UIAction(title: "Bags", state: selectedFilter == "Bags" ? .on : .off) { [weak self] action in
          //  self?.selectedFilter = "Bags"
            self?.applyFilter(type: "Bags")
            self?.setupMenu()
        }
        let menu = UIMenu(title: "Filter by", children: [allAction, shoesAction,bagsAction])
        let filterButton =  UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal.decrease.circle"),
            menu: menu
        )
        filterButton.tintColor = UIColor(named: "mainColor")
        navigationItem.rightBarButtonItem = filterButton
    }
    private func applyFilter(type : String = "All"){
        selectedFilter = type
        switch type {
        case "All":
            print("ALL SELECTED")
        case "shoes":
            print("shoes SELECTED")
        case "Bags":
            print("Bags SELECTED")
        default:
            return
        }
        productCollectionView.reloadData()
    }

    @objc private func didTapSearch() {
        searchHidden.toggle()
        print(searchHidden)
        searchBar.isHidden = searchHidden
    }

}
extension ProductsViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: productCollectionView.frame.width / 2 - 10, height: productCollectionView.frame.height / 2 - 60)
    }
    
}
