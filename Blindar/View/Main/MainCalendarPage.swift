//
//  MainCalendarPage.swift
//  Blindar
//
//  Created by Suji Lee on 5/30/24.
//

import SwiftUI

struct MainCalendarPage: View {
    @ObservedObject var mealVM: MealViewModel = MealViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    CalendarView()
                    MealContentsView()
                }
            }
            .onAppear {
                mealVM.fetchMeals()
            }
        }
    }
}

#Preview {
    MainCalendarPage()
}
