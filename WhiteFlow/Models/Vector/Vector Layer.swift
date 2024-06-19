//
//  Vector Layer.swift
//  WhiteFlow
//
//  Created by Nikita on 6/17/24.
//

import SwiftUI
import SwiftData

@Model
class VectorLayer: Identifiable, Hashable {
    @Attribute(.unique) var id: UUID
    var rotation: CGFloat
//    var fillColor: CGColor
//    var strokeColor: CGColor?
    var strokeWidth: CGFloat?
    
    var properties: WHGraphicProperties
    
    init(rotation: CGFloat, fillColor: CGColor) {
        self.id = UUID()
        self.rotation = rotation
//        self.fillColor = fillColor
        self.properties = .init()
    }
}
