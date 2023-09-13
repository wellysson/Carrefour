//
//  GitHubAPI.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import Foundation
import Alamofire
import ObjectMapper

class GitHubAPI {
    static func getUsers(completion: @escaping ([User]) -> Void) {
        AF.request("https://api.github.com/users").responseJSON { response in
            switch response.result {
            case .success(let value):
                do {
                    if let users = Mapper<User>().mapArray(JSONObject: value) {
                        completion(users)
                    } else {
                        print("Erro ao fazer o mapeamento JSON")
                    }
               } catch {
                   print("Erro ao fazer o parse JSON: \(error)")
               }
            case .failure(let error):
                print("Erro: \(error)")
            }
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
                        
        }
    }
}
