//
//  WhiteFlowDocument.swift
//  WhiteFlow
//
//  Created by Nikita on 6/15/24.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static let wflowEditDocument = UTType(exportedAs: "com.WhiteFlow.wflow")
}

struct WFlowEditDocument: FileDocument, Codable {
    var graphics: [Graphic]
    
    static var readableContentTypes: [UTType] { [.wflowEditDocument] }
    
    init() {
        let shape = Graphic(offset: .zero, size: CGSize(width: 100, height: 20))
        self.graphics = [shape]
    }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents
        else { throw CocoaError(.fileReadCorruptFile) }
        self.graphics = try JSONDecoder().decode([Graphic].self, from: data)
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = try JSONEncoder().encode(graphics)
        let fileWrapper = FileWrapper(regularFileWithContents: data)
        return fileWrapper
    }

    init(fileWrapper: FileWrapper, contentType: UTType) throws {
        let data = fileWrapper.regularFileContents!
        self = try JSONDecoder().decode(Self.self, from: data)
    }
    
    func write(to fileWrapper: inout FileWrapper, conentType: UTType) throws {
        let data = try JSONEncoder().encode(self)
        fileWrapper = FileWrapper(regularFileWithContents: data)
    }
}

/// Sources

import SwiftUI
import CoreServices
import CoreGraphics

public struct Graphic: Hashable, Codable, Identifiable {
    public var id: String
    
    private var _children: [Graphic] = []
    var children: [Graphic]? { _children.isEmpty ? nil : _children }
    
    var offset: CGPoint?
    var size: CGSize?
    
    public static func == (lhs: Graphic, rhs: Graphic) -> Bool {
        lhs.id == rhs.id
    }
    
    init(offset: CGPoint?, size: CGSize?) {
        self.id = UUID().uuidString
        self.offset = offset
        self.size = size
    }
    
    // Codable
    
    enum CodingKeys: CodingKey {
        case id
        case offset
        case size
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(offset, forKey: .offset)
        try container.encode(size, forKey: .size)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        offset = try container.decode(CGPoint.self, forKey: .offset)
        size = try container.decode(CGSize.self, forKey: .size)
    }
}
