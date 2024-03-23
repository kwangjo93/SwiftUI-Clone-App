//
//  MainTodoApp.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/21/24.
//

import SwiftUI

struct MainTodoApp: View {
    var body: some View {
        NavigationStack {
            TodoHome()
                .navigationTitle("Todo List")
        }
        .modelContainer(for: Todo.self)
    }
}

#Preview {
    MainTodoApp()
}
