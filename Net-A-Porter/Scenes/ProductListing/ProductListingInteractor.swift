//
//  ProductListingInteractor.swift
//  Net-A-Porter
//
//  Created by Cristian Spiridon on 07/03/2018.
//  Copyright (c) 2018 DigitalInsomnia. All rights reserved.

import UIKit

protocol ProductListingBusinessLogic
{
    func fetchProducts(request: ProductListing.FetchProducts.Request)
}

protocol ProductListingDataStore
{
    var products: [Product]? { get }
}

class ProductListingInteractor: ProductListingBusinessLogic, ProductListingDataStore
{
    var presenter: ProductListingPresentationLogic?
    var worker = ProductsWorker(productsStore: ProductsMemStore())
    
    var products: [Product]?
    
    // MARK: - Fetch products
    
    func fetchProducts(request: ProductListing.FetchProducts.Request)
    {
        worker.fetchProducts { (products) -> Void in
            self.products = products
            let response = ProductListing.FetchProducts.Response(products: products)
            self.presenter?.presentFetchedProducts(response: response)
        }
    }
}
