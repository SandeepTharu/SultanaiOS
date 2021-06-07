//
//  SultanaAPI.swift
//  Sultana
//
//  Created by Sandeep Tharu on 07/06/2021.
//

import Moya

let apiProvider = MoyaProvider<APIs>()

enum APIs : TargetType{
    
    case getPrayerTimes(city: String)
}

extension APIs{
    
    var baseURL: URL {
        return URL(string: "https://murmuring-spire-92548.herokuapp.com/")!
        
    }
    
    var path: String{
        switch self {
        case .getPrayerTimes:
            return "api/quran/prayers"
        }
    }
    
    var method: Method{
        switch self {
        case .getPrayerTimes:
            return .get
        }
    }
    
    var sampleData: Data{
        switch self {
        case .getPrayerTimes:
            return "".data(using: String.Encoding.utf8)!
        }
    }
    
    var task: Task{
        switch self {
        case .getPrayerTimes(let city):
            return .requestParameters(parameters: ["city": city], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]?{
        switch self {
        case .getPrayerTimes:
            return nil
        }
    }
}
