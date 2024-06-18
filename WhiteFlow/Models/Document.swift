//
//  Document.swift
//  WhiteFlow
//
//  Created by Nikita on 6/17/24.
//

import SwiftUI
import SwiftData

@Model
class WFDocument: Hashable {
    @Relationship(deleteRule: .cascade) var pages: [Page] = []
    @Relationship(deleteRule: .cascade) var selectedPages: [Page] = []
    
    init() {
        let page: Page = Page(name: "Page 1")
        self.pages = [page]
        self.selectedPages = [page]
    }
}
