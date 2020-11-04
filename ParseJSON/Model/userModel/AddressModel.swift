//
//  AddressModel.swift
//  ParseJSON
//
//  Created by Баир Надцалов on 04.11.2020.
//

import Foundation

struct AddressModel : Codable {
    
    var street : String?
    var suite : String?
    var city : String?
    var zipcode : String?
    var geo : GeoModel?
    
}
