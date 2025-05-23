//
// PageQuestionVO.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct PageQuestionVO: Codable, JSONEncodable, Hashable {

    public var countId: String?
    public var current: String?
    public var maxLimit: Int64?
    public var optimizeCountSql: Bool?
    public var orders: [OrderItem]?
    public var pages: String?
    public var records: [QuestionVO]?
    public var searchCount: Bool?
    public var size: String?
    public var total: String?

    public init(countId: String? = nil, current: String? = nil, maxLimit: Int64? = nil, optimizeCountSql: Bool? = nil, orders: [OrderItem]? = nil, pages: String? = nil, records: [QuestionVO]? = nil, searchCount: Bool? = nil, size: String? = nil, total: String? = nil) {
        self.countId = countId
        self.current = current
        self.maxLimit = maxLimit
        self.optimizeCountSql = optimizeCountSql
        self.orders = orders
        self.pages = pages
        self.records = records
        self.searchCount = searchCount
        self.size = size
        self.total = total
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case countId
        case current
        case maxLimit
        case optimizeCountSql
        case orders
        case pages
        case records
        case searchCount
        case size
        case total
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(countId, forKey: .countId)
        try container.encodeIfPresent(current, forKey: .current)
        try container.encodeIfPresent(maxLimit, forKey: .maxLimit)
        try container.encodeIfPresent(optimizeCountSql, forKey: .optimizeCountSql)
        try container.encodeIfPresent(orders, forKey: .orders)
        try container.encodeIfPresent(pages, forKey: .pages)
        try container.encodeIfPresent(records, forKey: .records)
        try container.encodeIfPresent(searchCount, forKey: .searchCount)
        try container.encodeIfPresent(size, forKey: .size)
        try container.encodeIfPresent(total, forKey: .total)
    }
}

