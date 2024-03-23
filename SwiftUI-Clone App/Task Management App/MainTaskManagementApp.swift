//
//  MainTaskManagementApp.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/22/24.
//

import SwiftUI

struct MainTaskManagementApp: View {
    var body: some View {
        TaskHome()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.bar)
            .preferredColorScheme(.light)
    }
}

#Preview {
    MainTaskManagementApp()
}
