//
//  ServiceController.swift
//  MapApp
//
//  Created by Abdülbaki Kaplan on 27.06.2020.
//  Copyright © 2020 Baki. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

struct ServiceController {
    func getPlaceData<T: Decodable>(with requestObject:URLRequest) -> Observable<[T]> {
        return Observable<[T]>.create { observer in
            let jsonDecoder = JSONDecoder()
                Alamofire.request(requestObject).responseData { (response: DataResponse<Data>) in
                    guard let responseData = response.value else {
                        fatalError("responseModel failed")
                    }
                    do {
                        let responseModel = try jsonDecoder.decode(T.self, from: responseData)
                        observer.onNext([responseModel])
                        observer.onCompleted()
                    }catch {
                        observer.onError(error)
                    }
                }
            return Disposables.create()
        }
    }
}
