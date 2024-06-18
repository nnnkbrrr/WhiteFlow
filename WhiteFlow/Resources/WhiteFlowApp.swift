//
//  WhiteFlowApp.swift
//  WhiteFlow
//
//  Created by Nikita on 6/15/24.
//

import SwiftUI

@main
struct WhiteFlowApp: App {
    var body: some Scene {
        DocumentGroup(editing: .wflwDocument, migrationPlan: WFDocumentsMigrationPlan.self) {
            ContentView()
        }
    }
}
