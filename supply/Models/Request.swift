//
//  Request.swift
//  supply
//
//  Created by Michael Zhu on 8/9/20.
//  Copyright © 2020 Michael Zhu. All rights reserved.
//
import Foundation
import SwiftUI
import CoreLocation

struct Request: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var nameDes: String
    var item: String
    var quantity: Int
    var imageName: String
    var coordinates: Coordinates
    var state: String
    var city: String
    var itemDes: String
    var url: String
    //var category: Category
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    
    static var idStart: Int = 2000
    init() {
        self.id = Request.idStart
        Request.idStart+=1
        self.name = ""
        self.item = ""
        self.quantity = 0
        self.imageName = ""
        self.city = ""
        self.state = ""
        self.coordinates = Coordinates()
        self.itemDes = ""
        self.nameDes = ""
        self.url = ""
    }
    
    init(id: Int, name: String, item: String, quantity: Int, imageName: String, latitude: Double, longitude: Double, city: String, state: String) {
        self.id = Request.idStart
        Request.idStart+=1
        self.name = name
        self.item = item
        self.quantity = quantity
        self.imageName = imageName
        self.city = city
        self.state = state
        self.coordinates = Coordinates(lat: latitude, long: longitude)
        self.itemDes = ""
        self.nameDes = ""
        self.url = ""
        
    }

//    enum Category: String, CaseIterable, Codable, Hashable {
//        case medical = "Medical"
//        case hygiene = "Hygiene"
//        case clothes = "Clothes"
//        case consumables = "Consumables"
//    }
}

extension Request {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

