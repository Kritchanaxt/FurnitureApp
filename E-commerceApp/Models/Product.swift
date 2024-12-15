//
//  Product.swift
//  E-commerceApp
//
//  Created by Kritchanat on 15/12/2567 BE.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var supplier: String
    var price: Int
    var width: String
    var height: String
    var diameter: String
    var quantity: Int = 1
}

var productList = [
    Product(
        name: "Leather Couch",
        image: "fn1",
        description: "A premium leather couch offering luxury and comfort, ideal for elegant living rooms.",
        supplier: "IKEA",
        price: 450,
        width: "220 cm",
        height: "140 cm",
        diameter: "110 cm"
    ),
    
    Product(
        name: "Fabric Sofa",
        image: "fn2",
        description: "This modern fabric sofa blends comfort with contemporary design for your home.",
        supplier: "Ashley Furniture",
        price: 300,
        width: "180 cm",
        height: "120 cm",
        diameter: "95 cm"
    ),
    
    Product(
        name: "Armchair",
        image: "ch1",
        description: "A classic armchair with high-quality fabric and wooden legs, perfect for reading corners.",
        supplier: "Home Center",
        price: 150,
        width: "90 cm",
        height: "100 cm",
        diameter: "85 cm"
    ),
    
    Product(
        name: "Recliner Chair",
        image: "ch2",
        description: "Comfortable recliner chair with adjustable backrest and footrest for ultimate relaxation.",
        supplier: "IKEA",
        price: 250,
        width: "100 cm",
        height: "120 cm",
        diameter: "90 cm"
    ),
    
    Product(
        name: "Dining Table",
        image: "fn3",
        description: "A 4-seater dining table set with a wooden finish, perfect for family meals.",
        supplier: "HomePro",
        price: 400,
        width: "150 cm",
        height: "75 cm",
        diameter: "80 cm"
    ),
    
    Product(
        name: "Wooden Table ",
        image: "fn4",
        description: "Stylish and sturdy coffee table made of solid wood for your living room.",
        supplier: "Ashley Furniture",
        price: 120,
        width: "120 cm",
        height: "50 cm",
        diameter: "60 cm"
    ),
    
    Product(
        name: "Office Chair",
        image: "ch3",
        description: "An ergonomic office chair with adjustable height, lumbar support, and breathable mesh.",
        supplier: "OfficeMax",
        price: 200,
        width: "70 cm",
        height: "110 cm",
        diameter: "50 cm"
    ),
    
    Product(
        name: "Outdoor Patio",
        image: "fn5",
        description: "A durable outdoor patio set with a weather-resistant table and four chairs.",
        supplier: "Home Depot",
        price: 600,
        width: "250 cm",
        height: "90 cm",
        diameter: "150 cm"
    ),
    
    Product(
        name: "Sofa Bed",
        image: "ch4",
        description: "A convertible sofa bed perfect for compact spaces, combining style and functionality.",
        supplier: "IKEA",
        price: 350,
        width: "180 cm",
        height: "90 cm",
        diameter: "70 cm"
    )
]
