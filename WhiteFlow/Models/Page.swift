//
//  Page.swift
//  WhiteFlow
//
//  Created by Nikita on 6/17/24.
//

import SwiftUI
import SwiftData

@Model
class Page: Identifiable, Hashable {
    @Attribute(.unique) var id: UUID
    var name: String
    var position: WFPagePosition?
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}
