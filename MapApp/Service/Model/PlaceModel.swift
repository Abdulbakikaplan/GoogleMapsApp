//
//  PlaceModel.swift
//  MapApp
//
//  Created by Abdülbaki Kaplan on 27.06.2020.
//  Copyright © 2020 Baki. All rights reserved.
//

import Foundation

struct PlaceModel:Decodable {
    let candidates: [PlaceFields]
    
    enum CodingKeys: String, CodingKey {
        case candidates
    }
}

struct Geometry:Decodable {
    let location:Location
    
    enum CodingKeys: String, CodingKey {
        case location
    }
}

struct Location:Decodable {
    let latitude:Double
    let longitude:Double
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
}
struct PlaceFields:Decodable {
    let name:String
    let formatted_address:String
    let geometry:Geometry
    let place_id:String
    let photos:[PhotoData]
    let rating:Double?

    
    enum CodingKeys: String, CodingKey {
        case name
        case formatted_address
        case geometry
        case place_id
        case photos
        case rating
    }
}

struct PhotoData:Decodable {
    let photo_reference:String
    
    enum CodingKeys: String, CodingKey {
        case photo_reference
    }
}
