//
//  MainCalendarPage.swift
//  Blindar
//
//  Created by Suji Lee on 5/30/24.
//

import SwiftUI
import SwiftData

struct MainCalendarPage: View {
    @ObservedObject var mealVM: MealViewModel = MealViewModel()
    @Environment(\.modelContext) private var modelContext
    @Query var savedSchools: [SchoolLocalData]
    @State var currentDate: Date = Date()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    CalendarView(currentDate: $currentDate)
                    MealContentsView()
                }
            }
            .onAppear {
                let extractedDate = extractYearAndMonth(from: currentDate)
//                mealVM.fetchMeals(schoolCode: savedSchools[0].schoolCode, year: extractedDate.year, month: extractedDate.monthWithZero)
                mealVM.fetchMeals(schoolCode: savedSchools[0].schoolCode, year: 2023, month: extractedDate.monthWithZero)
            }
        }
    }
}

#Preview {
    MainCalendarPage()
}
