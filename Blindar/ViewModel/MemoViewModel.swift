//
//  MemoViewModel.swift
//  Blindar
//
//  Created by Suji Lee on 7/16/24.
//

import Foundation
import Combine

class MemoViewModel: ObservableObject {
    @Published var memos: [Memo] = []
    @Published var newMemoId: String = ""
    @Published var errorMessage: String?
    private var cancellables = Set<AnyCancellable>()
    
    func fetchMemos(userId: String) {
        MemoAPI.shared.fetchMemos(userId: userId)
            .receive(on: DispatchQueue.main) // 메인 스레드에서 값을 받도록 설정
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { data in
                self.memos = data.response
                //디버깅
                print("memos : ", self.memos)
            })
            .store(in: &cancellables)
    }
    
    func postMemo(newMemo: Memo) {
        MemoAPI.shared.postMemos(newMemo: newMemo)
            .receive(on: DispatchQueue.main) // 메인 스레드에서 값을 받도록 설정
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { data in
                self.newMemoId = data.memoId
                //디버깅
                print("new memo id : ", self.newMemoId)
            })
            .store(in: &cancellables)
    }
    
    func deleteMemo(newMemo: Memo) {
        MemoAPI.shared.postMemos(newMemo: newMemo)
            .receive(on: DispatchQueue.main) // 메인 스레드에서 값을 받도록 설정
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { data in
                self.newMemoId = data.memoId
                //디버깅
                print("new memo id : ", self.newMemoId)
            })
            .store(in: &cancellables)
    }
}
