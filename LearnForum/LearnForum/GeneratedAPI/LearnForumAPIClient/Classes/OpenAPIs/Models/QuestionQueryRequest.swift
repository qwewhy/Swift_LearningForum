//
// QuestionQueryRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct QuestionQueryRequest: Codable, JSONEncodable, Hashable {

    public var answer: String?
    public var content: String?
    public var current: Int?
    public var id: Int64?
    public var notId: Int64?
    public var pageSize: Int?
    public var questionBankId: String?
    public var searchText: String?
    public var sortField: String?
    public var sortOrder: String?
    public var tags: [String]?
    public var title: String?
    public var userId: Int64?

    public init(answer: String? = nil, content: String? = nil, current: Int? = nil, id: Int64? = nil, notId: Int64? = nil, pageSize: Int? = nil, questionBankId: String? = nil, searchText: String? = nil, sortField: String? = nil, sortOrder: String? = nil, tags: [String]? = nil, title: String? = nil, userId: Int64? = nil) {
        self.answer = answer
        self.content = content
        self.current = current
        self.id = id
        self.notId = notId
        self.pageSize = pageSize
        self.questionBankId = questionBankId
        self.searchText = searchText
        self.sortField = sortField
        self.sortOrder = sortOrder
        self.tags = tags
        self.title = title
        self.userId = userId
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case answer
        case content
        case current
        case id
        case notId
        case pageSize
        case questionBankId
        case searchText
        case sortField
        case sortOrder
        case tags
        case title
        case userId
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(answer, forKey: .answer)
        try container.encodeIfPresent(content, forKey: .content)
        try container.encodeIfPresent(current, forKey: .current)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(notId, forKey: .notId)
        try container.encodeIfPresent(pageSize, forKey: .pageSize)
        try container.encodeIfPresent(questionBankId, forKey: .questionBankId)
        try container.encodeIfPresent(searchText, forKey: .searchText)
        try container.encodeIfPresent(sortField, forKey: .sortField)
        try container.encodeIfPresent(sortOrder, forKey: .sortOrder)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(userId, forKey: .userId)
    }
}


@available(iOS 13, tvOS 13, watchOS 6, macOS 10.15, *)
extension QuestionQueryRequest: Identifiable {}
