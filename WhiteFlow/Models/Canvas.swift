//
//  Canvas.swift
//  WhiteFlow
//
//  Created by Nikita on 6/17/24.
//

import SwiftUI
import SwiftData

@Model
class Canvas: Identifiable, Hashable {
    @Attribute(.unique) var id: UUID
    var name: String
//    var backgroundColor: Color
    var properties: WHGraphicProperties
    
    init(name: String, backgroundColor: Color) {
        self.id = UUID()
        self.name = name
//        self.backgroundColor = backgroundColor
        self.properties = .init()
    }
}
