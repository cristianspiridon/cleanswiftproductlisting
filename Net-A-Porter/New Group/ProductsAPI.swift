//
//  ProductsAPI.swift
//  Net-A-Porter
//
//  Created by Cristian Spiridon on 07/03/2018.
//  Copyright © 2018 DigitalInsomnia. All rights reserved.

//  Alamofire is a Swift-based HTTP networking library for
//  iOS and Mac OS X. It provides an elegant interface on top
//  of Apple’s Foundation networking stack that simplifies a
//  number of common networking tasks.

import Foundation
import Alamofire


class ProductsAPI: ProductsStoreProtocol
{

 func fetchProducts(completion: @escaping ([Product]?) -> Void) {
    
    
    let url = URL(string: "https://api.net-a-porter.com/NAP/GB/en/60/0/summaries")
    
    Alamofire.request(
           url!,
            method:.get,
            parameters: ["categoryIds": "2"])
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: \(response.result.error!)")
                    completion(nil)
                    return
                }
                
                guard let value = response.result.value as? [String: Any],
                    let rows = value["summaries"] as? [[String: Any]] else {
                        print("Malformed data received from fetchAllRooms service")
                        completion(nil)
                        return
                }
                
                var products:[Product] = [Product]()
                
                for prod in rows {
                    
                    products.append(Product(JSON: prod as [String:Any])!)
        
                }
                
                completion(products)
        }
    }
}
