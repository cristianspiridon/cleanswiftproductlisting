//
//  ProductListingModels.swift
//  Net-A-Porter
//
//  Created by Cristian Spiridon on 07/03/2018.
//  Copyright (c) 2018 DigitalInsomnia. All rights reserved.

import UIKit

enum ProductListing
{

  enum FetchProducts
  {
    struct Request
    {
    }
    struct Response
    {
        var products:[Product]
    }
    struct ViewModel
    {
        
        struct DisplayedProduct
        {
            var imgPath:String
            var title:String
            var price:String
        }
        
        var displayedProducts: [DisplayedProduct]
        
    }
  }
}
