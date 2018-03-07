//
//  ProductsWorker.swift
//  Net-A-Porter
//
//  Created by Cristian Spiridon on 07/03/2018.
//  Copyright © 2018 DigitalInsomnia. All rights reserved.
//

import Foundation

// MARK: - Orders worker

class ProductsWorker
{
    var productsStore: ProductsStoreProtocol
    
    init(productsStore: ProductsStoreProtocol)
    {
        self.productsStore = productsStore
    }
    
    func fetchProducts(completionHandler: @escaping ([Product]?) -> Void)
    {
        
        productsStore.fetchProducts { (products) in
          
                DispatchQueue.main.async {
                    completionHandler(products)
                }
          
        }
       
    }
    
}

// MARK: - Products store API

protocol ProductsStoreProtocol
{
  func fetchProducts(completion: @escaping ([Product]?) -> Void)
}

// MARK: - Products store CRUD operation results

enum ProductsStoreResult<U>
{
    case Success(result: U)
    case Failure(error: ProductsStoreError)
}

// MARK: - Products store CRUD operation errors

enum ProductsStoreError: Equatable, Error
{
    case CannotFetch(String)
}

func ==(lhs: ProductsStoreError, rhs: ProductsStoreError) -> Bool
{
    switch (lhs, rhs) {
    case (.CannotFetch(let a), .CannotFetch(let b)) where a == b: return true
    default: return false
    }
}
