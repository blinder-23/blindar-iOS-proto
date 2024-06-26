//
//  Schedule.swift
//  Blindar
//
//  Created by Suji Lee on 6/26/24.
//

import Foundation

struct Schedule {
    var school_code: Int //학교 코드
    var id: Int //일정 아이디(정수)
    var date: Int //UNIX epoch로 나타낸 날짜 (정수)
    var schedule: String //일정 제목
    var contents: String //일정 내용
}
