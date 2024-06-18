//
//  ContentView.swift
//  WhiteFlow
//
//  Created by Nikita on 6/15/24.
//

import SwiftUI
import SwiftData

@Model
final class Card {
    var front: String
    var back: String
    var creationDate: Date

    init(front: String, back: String, creationDate: Date = .now) {
        self.front = front
        self.back = back
        self.creationDate = creationDate
    }
}

extension Card: Hashable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.front == rhs.front &&
        lhs.back == rhs.back &&
        lhs.creationDate == rhs.creationDate
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(front)
        hasher.combine(back)
        hasher.combine(creationDate)
    }
}


struct ContentView: View {
//    @Query var document: [WFDocument]
    @Environment(\.modelContext) private var modelContext
//    @Query var pages: [Page]
    @Query private var cards: [Card]
    
    var body: some View {
        ScrollableView {
            HStack {
                Color.clear.frame(width: 200, height: 50)
                
                Button("New") {
//                    let newDoc = WFDocument()
//                    modelContext.insert(newDoc)
                    let newCard = Card(front: "Sample Front", back: "Sample Back")
                    modelContext.insert(newCard)
                }
                
                ForEach(cards) { card in
                    Text(card.front)
                }
//                ForEach(pages) { page in
//                    PageView(page: page)
//                }
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
