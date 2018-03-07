//
//  ProductListingWorker.swift
//  Net-A-Porter
//
//  Created by Cristian Spiridon on 07/03/2018.
//  Copyright (c) 2018 DigitalInsomnia. All rights reserved.

import UIKit

protocol ProductsListingProtocol
{
    func fetchProducts(completionHandler: @escaping (() throws
        -> [Product]) -> Void)
}

class ProductListingWorker
{
    var productsStore: ProductsListingProtocol
    init(productsStore: ProductsListingProtocol)
    {
        self.productsStore = productsStore
    }
    
    func fetchProducts(completionHandler: @escaping ([Product]) -> Void)
    {
        productsStore.fetchProducts { (products: () throws ->
            [Product]) -> Void in
            do {
                let products = try products()
                DispatchQueue.main.async {
                    completionHandler(products)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler([])
                }
            }
        }
    }
}
