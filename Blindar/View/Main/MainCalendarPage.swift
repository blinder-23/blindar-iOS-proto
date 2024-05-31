//
//  MainCalendarPage.swift
//  Blindar
//
//  Created by Suji Lee on 5/30/24.
//

import SwiftUI

struct MainCalendarPage: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                CalendarView()
                MealContentsView()
            }
        }
    }
}

#Preview {
    MainCalendarPage()
}
