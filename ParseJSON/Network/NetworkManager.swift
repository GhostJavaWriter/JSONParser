//
//  NetworkManager.swift
//  ParseJSON
//
//  Created by Баир Надцалов on 03.11.2020.
//

import Foundation

struct NetworkManager {
    
    func getPosts(with urlString: String, result: @escaping (([PostModel]) -> ())) {
        
        if let url = URL(string: urlString) {
            
            if let data = try? Data(contentsOf: url) {
                
                let decoder = JSONDecoder()
            
                if let jsonData = try? decoder.decode([PostModel].self, from: data) {
                    
                    result(jsonData)
                    
                } else { print("decoding error") }
                
            } else { print("parse error") }
            
        } else { print("url loading error") }
        
    }
    
    func getAuthors(with urlString: String, result: @escaping (([UserModel]) -> ())) {
        
        if let url = URL(string: urlString) {
            
            if let data = try? Data(contentsOf: url) {
                
                let decoder = JSONDecoder()
            
                if let jsonData = try? decoder.decode([UserModel].self, from: data) {
                    
                    result(jsonData)
                    
                } else { print("decoding error") }
                
            } else { print("parse error") }
            
        } else { print("url loading error") }
        
    }
    
    func getComments(with urlString: String, result: @escaping (([CommentModel]) -> ())) {
        
        if let url = URL(string: urlString) {
            
            if let data = try? Data(contentsOf: url) {
                
                let decoder = JSONDecoder()
            
                if let jsonData = try? decoder.decode([CommentModel].self, from: data) {
                    
                    result(jsonData)
                    
                } else { print("decoding error") }
                
            } else { print("parse error") }
            
        } else { print("url loading error") }
        
    }
}
