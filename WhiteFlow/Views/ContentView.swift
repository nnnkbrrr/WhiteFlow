//
//  ContentView.swift
//  WhiteFlow
//
//  Created by Nikita on 6/15/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var pages: [Page]
    
    var body: some View {
        ScrollableView {
            HStack {
                Color.clear.frame(width: 200, height: 50)
                
                Button("New") {
                    let newPage = Page(name: "Page 1")
                    modelContext.insert(newPage)
                }
                
                ForEach(pages) { page in
                    PageView(page: page)
                }
            }
        }
    }
}

struct PageView: View {
    @Bindable var page: Page
    
    var body: some View {
        TextField("", text: $page.name)
    }
}

#Preview {
    ContentView()
}
