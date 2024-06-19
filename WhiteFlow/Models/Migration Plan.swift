//
//  Migration Plan.swift
//  WhiteFlow
//
//  Created by Nikita on 6/17/24.
//

import SwiftData

struct WFDocumentsMigrationPlan: SchemaMigrationPlan {
    static let schemas: [VersionedSchema.Type] = [WFDocumentsVersionedSchema.self]
    static let stages: [MigrationStage] = []
}

struct WFDocumentsVersionedSchema: VersionedSchema {
    static let models: [any PersistentModel.Type] = [Page.self]
    static let versionIdentifier: Schema.Version = .init(1, 0, 0)
}
