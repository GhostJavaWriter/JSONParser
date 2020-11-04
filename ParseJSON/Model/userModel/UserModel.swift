//
//  UserModel.swift
//  ParseJSON
//
//  Created by Баир Надцалов on 04.11.2020.
//

import Foundation

struct UserModel : Codable {
    
    var id       : Int?
    var name     : String?
    var username : String?
    var email    : String?
    var address  : AddressModel?
    var phone    : String?
    var website  : String?
    var company  : CompanyModel?
    
}
