//
//  TodoListBundle.swift
//  TodoList
//
//  Created by 천광조 on 3/21/24.
//

import WidgetKit
import SwiftUI

@main
struct TodoListBundle: WidgetBundle {
    var body: some Widget {
        TodoList()
        TodoListLiveActivity()
    }
}
