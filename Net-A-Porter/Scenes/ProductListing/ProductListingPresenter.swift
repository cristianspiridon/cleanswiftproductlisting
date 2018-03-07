//
//  ProductListingPresenter.swift
//  Net-A-Porter
//
//  Created by Cristian Spiridon on 07/03/2018.
//  Copyright (c) 2018 DigitalInsomnia. All rights reserved.

import UIKit

protocol ProductListingPresentationLogic
{
  func presentFetchedProducts(response: ProductListing.FetchProducts.Response)
}

class ProductListingPresenter: ProductListingPresentationLogic
{
  weak var viewController: ProductListingDisplayLogic?
  
    let currencyFormatter: NumberFormatter = {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        return currencyFormatter
    }()
  
  func presentFetchedProducts(response: ProductListing.FetchProducts.Response)
  {
    
    var displayedProducts:[ProductListing.FetchProducts.ViewModel.DisplayedProduct] = []
    for product in response.products {
        
        let title  = product.title
        let imgsrc = product.imgsrc
        let price  = product.price
 
        let displayedProduct = ProductListing.FetchProducts.ViewModel.DisplayedProduct(imgPath:imgsrc, title:title, price:price)
        displayedProducts.append(displayedProduct)
    }
    
    let viewModel = ProductListing.FetchProducts.ViewModel(displayedProducts:displayedProducts)
    viewController?.displayedProducts(viewModel: viewModel)
    
  }
}
