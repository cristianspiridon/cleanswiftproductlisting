import Foundation
import ObjectMapper

class Product: Mappable
{
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        price <- map["price"]
        images <- map["images"]
    }
    
    
    var id:Int?
    var name:String?
    var price:Price?
    var images:Images?
    
}

class Images:Mappable{
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        shots <- map["shots"]
        sizes <- map["sizes"]
        mediaType <- map["mediaType"]
        urlTemplate <- map["urlTemplate"]
    }
    
    
    var shots:[String]?
    var sizes:[String]?
    var mediaType:String?
    var urlTemplate:String?
}

class Price:Mappable {
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        currency <- map["currency"]
        divisor <- map["divisor"]
        amount <- map["amount"]
    }
    
    var currency:String?
    var divisor:Int?
    var amount:Int?
}

