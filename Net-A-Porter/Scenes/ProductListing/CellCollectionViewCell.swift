//
//  CellCollectionViewCell.swift
//  Net-A-Porter
//
//  Created by Cristian Spiridon on 07/03/2018.
//  Copyright © 2018 DigitalInsomnia. All rights reserved.
//

import UIKit

class CellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var productName: UITextView!
    @IBOutlet var productPrice: UILabel!
    
    func setData(data:ProductListing.FetchProducts.ViewModel.DisplayedProduct){
        
        productName.text = data.title
        productPrice.text = data.price
        
        loadImage(fileName: data.imgPath)
    }
    
    private func loadImage(fileName: String)  {
        
        let url = URL(string: fileName)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) 
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data!)
            }
        }
        
    }
        
    
}
