//
//  User.swift
//  Blindar
//
//  Created by Suji Lee on 6/26/24.
//

import Foundation

struct User {
    var user_id: String //Google Firebase UID
    var school_code: Int //NEIS API에서 제공하는 표준 학교 코드
    var name: String //유저 닉네임
}
