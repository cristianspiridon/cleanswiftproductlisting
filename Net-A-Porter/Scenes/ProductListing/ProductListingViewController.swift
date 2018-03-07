//
//  ProductListingViewController.swift
//  Net-A-Porter
//
//  Created by Cristian Spiridon on 07/03/2018.
//  Copyright (c) 2018 DigitalInsomnia. All rights reserved.

import UIKit

protocol ProductListingDisplayLogic: class
{
  func displayedProducts(viewModel: ProductListing.FetchProducts.ViewModel)
}

class ProductListingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ProductListingDisplayLogic
{
    
    var interactor: ProductListingBusinessLogic?
  
    var router: (NSObjectProtocol & ProductListingRoutingLogic & ProductListingDataPassing)?

  
    // MARK: Object lifecycle
  
    var displayedProducts: [ProductListing.FetchProducts.ViewModel.DisplayedProduct] = []
    
    @IBOutlet var collectionView: UICollectionView!
    
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = ProductListingInteractor()
    let presenter = ProductListingPresenter()
    let router = ProductListingRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    fetchOnLoad()
    layoutUICollection()
  }
  
  
    func fetchOnLoad()
    {
        let request = ProductListing.FetchProducts.Request()
        interactor?.fetchProducts(request: request)
    }
    
    func layoutUICollection() {
        
        print("layout collection")
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 30) / 2, height: (self.collectionView.frame.size.height / 2))
        
    }
  
  func displayedProducts(viewModel: ProductListing.FetchProducts.ViewModel)
  {
        displayedProducts = viewModel.displayedProducts
    
        print("load data on screen \(displayedProducts)")
        //load data on screen
        collectionView.reloadData()
    
    }
    
    
    // MARK: UICollectionView DataSource & Delegates
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return  displayedProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        (cell as! CellCollectionViewCell).setData(data: displayedProducts[indexPath.row])
    }
}
