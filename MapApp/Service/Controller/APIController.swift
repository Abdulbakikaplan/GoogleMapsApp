//
//  APIController.swift
//  MapApp
//
//  Created by Abdülbaki Kaplan on 27.06.2020.
//  Copyright © 2020 Baki. All rights reserved.
//

import Foundation

typealias ApiSecretKey = String
typealias ServiceBaseURL = String
typealias SearchInputText = String
typealias PlaceID = String
typealias photoRefID = String

enum APIConstant:String {
    case secretKey = "BURAYA GOOGLE MAPS API KEY YAZILACAK"
    //FATURALANDIRMADAN DOLAYI API KEYE BURAYA KOYMADIM
}

enum APIPath:String{
    case place = "/maps/api/place/findplacefromtext/json"
    case placeDetail = "/maps/api/place/details/json"
    case placePhoto = "/maps/api/place/photo"
}

struct APIController {
    private var urlComponents = URLComponents()
    
    private let secretKey = APIConstant.secretKey.rawValue
    
    init() {
        self.urlComponents.scheme = "https"
        self.urlComponents.host = "maps.googleapis.com"
    }
    
    mutating func findPlace(with searchText:SearchInputText) -> URLRequest {
        self.urlComponents.path = APIPath.place.rawValue
        
        let inputQuery = URLQueryItem(name: "input", value: searchText)
        let inputType = URLQueryItem(name: "inputtype", value: "textquery")
        let scretKey = URLQueryItem(name: "key", value: secretKey)
        let fields = URLQueryItem(name: "fields", value: "name,formatted_address,geometry,place_id,photos,rating")
        
        urlComponents.queryItems = [inputQuery,inputType,scretKey,fields]
        
        guard let requestURL = urlComponents.url else { fatalError("request url can't created")}
        
        var urlRequest = URLRequest(url: requestURL)
        urlRequest.httpMethod = "GET"
        
        return urlRequest
    }
    
    mutating func getPlaceDetail(with placeID:PlaceID) -> URLRequest {
        
        self.urlComponents.path = APIPath.placeDetail.rawValue
        
        let inputQuery = URLQueryItem(name: "place_id", value: placeID)
        let inputType = URLQueryItem(name: "inputtype", value: "textquery")
        let scretKey = URLQueryItem(name: "key", value: secretKey)
        let fields = URLQueryItem(name: "fields", value: "name,formatted_address,photo")

        urlComponents.queryItems = [inputQuery,inputType,scretKey,fields]
        
        guard let requestURL = urlComponents.url else { fatalError("request url can't created") }
        
        var urlRequest = URLRequest(url: requestURL)
        urlRequest.httpMethod = "GET"
        
        return urlRequest
    }
    
    mutating func getPlaceImage(with photoRef:photoRefID) -> URLRequest {
        
        self.urlComponents.path = APIPath.placePhoto.rawValue
        
        let maxWidth = URLQueryItem(name: "maxwidth", value: "300")
        let photoRef = URLQueryItem(name: "photoreference", value: photoRef)
        let scretKey = URLQueryItem(name: "key", value: secretKey)
        
        urlComponents.queryItems = [maxWidth,photoRef,scretKey]
        
        guard let requestURL = urlComponents.url else { fatalError("request url can't created") }
        
        var urlRequest = URLRequest(url: requestURL)
        urlRequest.httpMethod = "GET"
        
        return urlRequest
    }
    
}
