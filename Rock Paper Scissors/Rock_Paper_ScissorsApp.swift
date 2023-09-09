//
//  Rock_Paper_ScissorsApp.swift
//  Rock Paper Scissors
//
//  Created by Colten Glover on 9/5/23.
//

import SwiftUI

@main
struct Rock_Paper_ScissorsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
