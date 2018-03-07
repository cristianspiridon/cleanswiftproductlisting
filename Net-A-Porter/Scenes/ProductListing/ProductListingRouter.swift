//
//  ProductListingRouter.swift
//  Net-A-Porter
//
//  Created by Cristian Spiridon on 07/03/2018.
//  Copyright (c) 2018 DigitalInsomnia. All rights reserved.

import UIKit

@objc protocol ProductListingRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ProductListingDataPassing
{
  var dataStore: ProductListingDataStore? { get }
}

class ProductListingRouter: NSObject, ProductListingRoutingLogic, ProductListingDataPassing
{
  weak var viewController: ProductListingViewController?
  var dataStore: ProductListingDataStore?

}
