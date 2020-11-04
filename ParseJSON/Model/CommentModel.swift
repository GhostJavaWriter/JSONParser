//
//  CommentModel.swift
//  ParseJSON
//
//  Created by Баир Надцалов on 04.11.2020.
//

import Foundation

struct CommentModel : Codable {
    
    var postId : Int?
    var id     : Int?
    var name   : String?
    var email  : String?
    var body   : String?
    
}
