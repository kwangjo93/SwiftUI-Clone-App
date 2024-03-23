//
//  TodoRowView.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/21/24.
//

import SwiftUI
import WidgetKit

struct TodoRowView: View {
    @Bindable var todo: Todo
    @FocusState private var isActive: Bool
    @Environment(\.modelContext) private var context
    @Environment(\.scenePhase) private var phase
    var body: some View {
        HStack(spacing: 8) {
            if !isActive && !todo.task.isEmpty {
                Button(action: {
                    todo.isCompleted.toggle()
                    todo.lastUpdated = .now
                    WidgetCenter.shared.reloadAllTimelines()
                }, label: {
                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                        .font(.title2)
                        .padding(3)
                        .contentShape(.rect)
                        .foregroundStyle(todo.isCompleted ? .gray : .accentColor)
                        .contentTransition(.symbolEffect(.replace))
                })
            }
            
            TextField("Record Video", text: $todo.task)
                .strikethrough(todo.isCompleted)
                .foregroundStyle(todo.isCompleted ? .gray : .primary)
                .focused($isActive)
            
            if !isActive && !todo.task.isEmpty {
                //Priority Menu Button(For Updating)
                Menu {
                    ForEach(Priority.allCases, id: \.rawValue) { priority in
                        Button(action: {
                            todo.priority = priority
                        }, label: {
                            HStack {
                                Text(priority.rawValue)
                                if todo.priority == priority {
                                    Image(systemName: "checkmark")
                                }
                            }
                        })
                    }
                } label: {
                    Image(systemName: "circle.fill")
                        .font(.title2)
                        .padding(3)
                        .contentShape(.rect)
                        .foregroundStyle(todo.priority.color.gradient)
                }
            }
        }
        .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
        .animation(.snappy, value: isActive)
        .onAppear {
            isActive = todo.task.isEmpty
        }
        //Swipe to Delete
        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
            Button("", systemImage: "trash") {
                context.delete(todo)
                WidgetCenter.shared.reloadAllTimelines()
            }
            .tint(.red)
        }
        //리턴키를 눌렀을 때 값이 비어 있다면 삭제해라
        .onSubmit(of: .text) {
            if todo.task.isEmpty {
                //Deleting Empty Todo
                context.delete(todo)
                WidgetCenter.shared.reloadAllTimelines()
            }
        }
        .onChange(of: phase) { oldValue, newVlaue in
            if newVlaue != .active && todo.task.isEmpty {
                context.delete(todo)
                WidgetCenter.shared.reloadAllTimelines()
            }
        }
        .task {
            todo.isCompleted = todo.isCompleted
        }
    }
}

#Preview {
    MainTodoApp()
}
