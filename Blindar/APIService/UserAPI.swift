//
//  School.swift
//  Blindar
//
//  Created by Suji Lee on 6/27/24.
//

import Combine
import Foundation

class APIService {
    static let shared = APIService()
    private let baseURL = "https://api.example.com"

    func fetchShcools() -> AnyPublisher<[School], Error> {
        let url = URL(string: "\(baseURL)/school_list")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [School].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    // 다른 모델들에 대해서도 비슷한 메소드들을 추가합니다.
}
