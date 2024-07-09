//
//  MealViewModel.swift
//  Blindar
//
//  Created by Suji Lee on 7/9/24.
//

import Combine
import SwiftUI

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var errorMessage: String?
    private var cancellables = Set<AnyCancellable>()
    
    func fetchSchools() {
        SchoolAPI.shared.fetchSchools()
            .receive(on: DispatchQueue.main) // 메인 스레드에서 값을 받도록 설정
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { meals in
                self.meals = meals
            })
            .store(in: &cancellables)
    }
}
