//
//  Shcool.swift
//  Blindar
//
//  Created by Suji Lee on 6/26/24.
//

import Foundation
import SwiftData

struct SchoolResponse: Codable {
    let message: String
    let responseCode: Int
    let data: [School]
}

// Define the refined data structure
struct School: Codable, Hashable {
    let schoolName: String
    //    let atptOfcdcScCode: String
    let schoolCode: Int
    
    enum CodingKeys: String, CodingKey {
        case schoolCode = "school_code"
        //            case atptOfcdcScCode = "atpt_ofcdc_sc_code"
        case schoolName = "school_name"
    }
    
}

@Model
class SchoolLocalData {
    var school_name: String //학교 이름 (한글)
    
    init(school_name: String) {
        self.school_name = school_name
    }
}
