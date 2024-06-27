//
//  Feedback.swift
//  Blindar
//
//  Created by Suji Lee on 6/26/24.
//

import Foundation
import SwiftData

struct Feedback: Codable {
    var user_id: String //사용자 id
    var device_name: String //기기 이름 ex.SM-F731
    var os_version: String  //OS version
    var app_version: String  //App version
    var contents: String //피드백 내용
}

@Model
class FeedbackData {
    var user_id: String //사용자 id
    var device_name: String //기기 이름 ex.SM-F731
    var os_version: String  //OS version
    var app_version: String  //App version
    var contents: String //피드백 내용
    
    init(user_id: String, device_name: String, os_version: String, app_version: String, contents: String) {
        self.user_id = user_id
        self.device_name = device_name
        self.os_version = os_version
        self.app_version = app_version
        self.contents = contents
    }
}
