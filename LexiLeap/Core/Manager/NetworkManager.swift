
//  NetworkManager.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 18.07.2024.


import Foundation
import Alamofire
final class NetworkManager{
    func fetchResult<T:Codable>(url:String,headers:HTTPHeaders?,parameters:Parameters?,type:T.Type) async throws -> T?{
        let dataRequest = AF.request(url,method: .get,parameters: parameters,headers: headers)
            .validate()
            .serializingDecodable(T.self)
        
        let result = await dataRequest.response
        
        
        guard let value = result.value else {
            print("error: \(String(describing: result.error))")
            return nil
        }
        return value
    }
   
}



