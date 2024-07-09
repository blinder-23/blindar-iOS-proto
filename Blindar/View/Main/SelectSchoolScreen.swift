//
//  SelectSchoolScreen.swift
//  Blindar
//
//  Created by Suji Lee on 6/27/24.
//

import SwiftUI
import SwiftData

struct SelectSchoolScreen: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var schoolVM = SchoolViewModel()
    @State var query: String = ""
    var filteredSchools: [School] {
        if query.isEmpty {
            return schoolVM.schools
        } else {
            return schoolVM.schools.filter { $0.schoolName.contains(query) }
        }
    }
    @Query var savedSchools: [SchoolLocalData]
    
    var body: some View {
        VStack {
            //헤더
            HStack {
                Text("학교 선택")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            .padding(.vertical, 20)
            //검색바
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.white)
                .frame(width: screenWidth * 0.92, height: 60)
                .overlay {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField(text: $query, prompt: Text("학교 이름 검색").foregroundStyle(.hexC6C6CA), label: {
                            EmptyView()
                        })
                    }
                    .padding()
                }
            //학교 목록
            List {
                ForEach(filteredSchools, id: \.schoolCode) { school in
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 3) {
                            Text(school.schoolName)
                        }
                        .padding(.bottom)
                        Rectangle()
                            .frame(height: 0.3)
                    }
                    .onTapGesture {
                        saveSchoolsToLocal(school: school)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .padding(.vertical, 10)
        }
        .onAppear(perform: {
            schoolVM.fetchSchools()
        })
    }
    
    private func saveSchoolsToLocal(school: School) {
        for savedSchool in savedSchools {
            modelContext.delete(savedSchool)
        }
        
        // Insert new school
        let schoolToSave = SchoolLocalData(schoolName: school.schoolName, schoolCode: school.schoolCode)
        modelContext.insert(schoolToSave)
        try? modelContext.save()
    }
}

#Preview {
    SelectSchoolScreen()
}
