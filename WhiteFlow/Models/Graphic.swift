//
//  Graphic.swift
//  WhiteFlow
//
//  Created by Nikita on 6/17/24.
//

import SwiftUI
import SwiftData

@Model
class Graphic: Hashable, Identifiable {
    @Attribute(.unique) var id: UUID
    @Relationship(deleteRule: .cascade) private(set) var children: [Graphic] = []
    
    var offset: WFPoint?
    var size: WFSize?
    var opacity: CGFloat?
    
    init(offset: CGPoint? = nil, size: CGSize? = nil, opacity: CGFloat? = nil) {
        self.id = UUID()
    }
    
    func add(child: Graphic) {
        children.append(child)
    }

    func remove(child: Graphic) {
        children.removeAll { $0.id == child.id }
    }
    
    public static func == (lhs: Graphic, rhs: Graphic) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
