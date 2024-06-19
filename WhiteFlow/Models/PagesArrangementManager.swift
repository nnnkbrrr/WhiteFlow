//
//  PagesArrangementManager.swift
//  WhiteFlow
//
//  Created by Nikita on 6/19/24.
//

import SwiftUI
import SwiftData

class PagesArrangementManager {
    @Query var pages: [Page]
    var activePages: [Page] { return pages.filter({ $0.position != nil }) }
    
    func set(page: Page, position: WFPagePosition) {
#warning("set page position")
    }
    
    func remove(page: Page, position: WFPagePosition) {
#warning("remove page position")
    }
}
