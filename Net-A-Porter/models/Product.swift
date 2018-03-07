import Foundation

struct Product: Equatable
{
    // MARK: Product info
    
    var title: String
    var price: String
    var imgsrc: String
    var id: String
}

func ==(lhs: Product, rhs: Product) -> Bool
{
    return lhs.title == rhs.title
        && lhs.price == rhs.price
        && lhs.imgsrc == rhs.imgsrc
}

