//
//  ProductsMemStore.swift
//  Net-A-Porter
//
//  Created by Cristian Spiridon on 07/03/2018.
//  Copyright © 2018 DigitalInsomnia. All rights reserved.
//

import UIKit

class ProductsMemStore: ProductsStoreProtocol {
    
    static var products = [
        Product(title:"Product title", price:"1.29", imgsrc:"http://", id:"987329176"),
        Product(title:"Product title", price:"1.29", imgsrc:"http://", id:"9874302987")
    ]
    
    func fetchProducts(completionHandler: @escaping (() throws -> [Product]) -> Void) {
         completionHandler { return type(of: self).products }
    }
    

}
