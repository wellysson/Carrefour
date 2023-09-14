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
                if let users = Mapper<User>().mapArray(JSONObject: value) {
                    completion(users)
                } else {
                    print("Erro ao fazer o mapeamento JSON")
                    completion([])
                }
            case .failure(let error):
                print("Erro: \(error)")
                completion([])
            }
            print("Request: \(String(describing: response.request))")
            print("Result: \(response.result)")
        }
    }
    
    static func getUserDetail(userLogin: String, completion: @escaping (UserDetail?) -> Void) {
        AF.request("https://api.github.com/users/\(userLogin)").responseJSON { response in
            switch response.result {
            case .success(let value):
                if let userDetail = Mapper<UserDetail>().map(JSONObject: value) {
                    completion(userDetail)
                } else {
                    print("Erro ao fazer o mapeamento JSON")
                    completion(nil)
                }
            case .failure(let error):
                print("Erro: \(error)")
                completion(nil)
            }
            print("Request: \(String(describing: response.request))")
            print("Result: \(response.result)")
        }
    }
    
    static func getRepositories(userLogin: String, completion: @escaping ([Repository]) -> Void) {
        AF.request("https://api.github.com/users/\(userLogin)/repos").responseJSON { response in
            switch response.result {
            case .success(let value):
                if let repositories = Mapper<Repository>().mapArray(JSONObject: value) {
                    completion(repositories)
                } else {
                    print("Erro ao fazer o mapeamento JSON")
                    completion([])
                }
            case .failure(let error):
                print("Erro: \(error)")
                completion([])
            }
            print("Request: \(String(describing: response.request))")
            print("Result: \(response.result)")
                        
        }
    }
}
