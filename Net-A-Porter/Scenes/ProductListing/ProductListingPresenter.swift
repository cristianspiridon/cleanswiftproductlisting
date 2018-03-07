//
//  ProductListingPresenter.swift
//  Net-A-Porter
//
//  Created by Cristian Spiridon on 07/03/2018.
//  Copyright (c) 2018 DigitalInsomnia. All rights reserved.

import UIKit

extension String
{
    func replace(target: String, withString: String) -> String
    {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}

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
        
        let title  = product.name
        var imgsrc:String = (product.images?.urlTemplate)!
        
        imgsrc = imgsrc.replace(target: "{{scheme}}", withString: "https:")
        imgsrc = imgsrc.replace(target: "{{shot}}", withString: "in")
        imgsrc = imgsrc.replace(target: "{{size}}", withString: "m2")
        
        print(imgsrc)
        
        let price  = convertToCurrency(value: Double((product.price?.amount)! / (product.price?.divisor)!))
 
        let displayedProduct = ProductListing.FetchProducts.ViewModel.DisplayedProduct(imgPath:imgsrc, title:title!, price:price)
        displayedProducts.append(displayedProduct)
    }
    
    let viewModel = ProductListing.FetchProducts.ViewModel(displayedProducts:displayedProducts)
    viewController?.displayedProducts(viewModel: viewModel)
    
  }
    
    func convertToCurrency(value:Double) -> String {
        
        let cForm = NumberFormatter()
        cForm.usesGroupingSeparator = true
        cForm.numberStyle = .currency
        
        let priceString = cForm.string(from: NSNumber(value: value))
        
        
        return priceString!
        
    }
}
