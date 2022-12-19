//
//  MandaProjectApp.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/11.
//

import SwiftUI

// root scene
@main
struct MandaProjectApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
