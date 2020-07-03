//
//  FetchCountries.swift
//  List Example
//
//  Created by GL on 7/3/20.
//  Copyright © 2020 GL. All rights reserved.
//

import Alamofire

class FetchCountries {
    private let baseUrlPath = "https://restcountries.eu/rest/v2/all"
    
    public func fetch(_ completion: @escaping ([Country]?)->Void) {
        AF.request(baseUrlPath).responseDecodable { (response: DataResponse<[Country], AFError>) in
            switch response.result {
            case .success(let country):
                completion(country)
            case .failure(let error):
                completion(nil)
                print(error)
            }
        }
    }
}
