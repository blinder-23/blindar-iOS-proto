//
//  Shcool.swift
//  Blindar
//
//  Created by Suji Lee on 6/26/24.
//

import Foundation
import SwiftData

struct School: Codable {
    var school_name: String //학교 이름 (한글)
    var school_code: String //NEIS API에서 제공하는 표준 학교 코드
}

@Model
class SchoolData {
    var school_name: String //학교 이름 (한글)
    var school_code: String //NEIS API에서 제공하는 표준 학교 코드
    
    init(school_name: String, school_code: String) {
        self.school_name = school_name
        self.school_code = school_code
    }
}
