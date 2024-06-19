//
//  Graphic.swift
//  WhiteFlow
//
//  Created by Nikita on 6/17/24.
//

import SwiftUI
import SwiftData

@Model
class WHGraphicProperties: Identifiable, Hashable {
    @Attribute(.unique) var id: UUID
    @Relationship(deleteRule: .cascade) private(set) var children: [WHGraphicProperties] = []
    
    var offset: WFPoint?
    var size: WFSize?
    var opacity: CGFloat?
    
    init(offset: CGPoint? = nil, size: CGSize? = nil, opacity: CGFloat? = nil) {
        self.id = UUID()
    }
    
    func add(child: WHGraphicProperties) {
        children.append(child)
    }
    
    func remove(child: WHGraphicProperties) {
        children.removeAll { $0.id == child.id }
    }
}
