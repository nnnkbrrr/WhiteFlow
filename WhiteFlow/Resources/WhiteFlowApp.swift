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
        WindowGroup {
            VStack(alignment: .leading, spacing: 15) {
                Text("Onboarding")
                
                Button("New Document") {
                    NSApp.sendAction(#selector(NSWindow.performClose(_:)), to: nil, from: nil)
                    NSDocumentController.shared.newDocument(nil)
                }
                
                Text("Recents")
                
                ForEach(NSDocumentController.shared.recentDocumentURLs, id: \.self) { url in
                    OpenDocumentButton(url: url)
                }
             }
        }
        
        DocumentGroup(editing: .wflwDocument, migrationPlan: WFDocumentsMigrationPlan.self) {
            ContentView()
        }
    }
}

struct OpenDocumentButton: View {
    var url: URL
    @Environment(\.openDocument) private var openDocument


    var body: some View {
        Button {
            Task {
                do {
                    try await openDocument(at: url)
                } catch {
                    // Handle error
                }
            }
        } label: {
            Text("Open \(url.deletingPathExtension().lastPathComponent)")
        }
    }
}
