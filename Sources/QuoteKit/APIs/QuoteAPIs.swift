//
//  File.swift
//  
//
//  Created by Rudrank Riyam on 03/10/21.
//

import Foundation

public extension QuoteKit {
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    static func quote(id: String) async throws -> Quote? {
        try await execute(with: QuotableEndpoint(.quote(id)))
    }
    
    @available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
    static func quote(id: String, completion: @escaping (Result<Quote?, Error>) -> ()) {
        execute(with: QuotableEndpoint(.quote(id)), completion: completion)
    }
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    static func quotes(minLength: Int? = nil,
                       maxLength: Int? = nil,
                       tags: [String]? = nil,
                       type: URLQueryItemListType = .all,
                       authors: [String]? = nil,
                       sortBy: QuotesSortType? = nil,
                       order: QuotableListOrder? = nil,
                       limit: Int = 20,
                       page: Int = 1) async throws -> Quotes? {
        
        let queryItems = quotesParameter(minLength: minLength,
                                         maxLength: maxLength,
                                         tags: tags,
                                         type: type,
                                         authors: authors,
                                         sortBy: sortBy,
                                         order: order,
                                         limit: limit,
                                         page: page)
        
        return try await execute(with: QuotableEndpoint(.quotes, queryItems: queryItems))
    }
    
    @available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
    static func quotes(minLength: Int? = nil,
                       maxLength: Int? = nil,
                       tags: [String]? = nil,
                       type: URLQueryItemListType = .all,
                       authors: [String]? = nil,
                       sortBy: QuotesSortType? = nil,
                       order: QuotableListOrder? = nil,
                       limit: Int = 20,
                       page: Int = 1,
                       completion: @escaping (Result<Quotes?, Error>) -> ()) {
        
        let queryItems = quotesParameter(minLength: minLength,
                                         maxLength: maxLength,
                                         tags: tags,
                                         type: type,
                                         authors: authors,
                                         sortBy: sortBy,
                                         order: order,
                                         limit: limit,
                                         page: page)
        
        return execute(with: QuotableEndpoint(.quotes, queryItems: queryItems), completion: completion)
    }
    
    @available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
    static private func quotesParameter(minLength: Int? = nil,
                                        maxLength: Int? = nil,
                                        tags: [String]? = nil,
                                        type: URLQueryItemListType = .all,
                                        authors: [String]? = nil,
                                        sortBy: QuotesSortType? = nil,
                                        order: QuotableListOrder? = nil,
                                        limit: Int = 20,
                                        page: Int = 1) -> [URLQueryItem] {
        
        var queryItems: [URLQueryItem] = []
        
        queryItems.append(.limit(limit))
        queryItems.append(.page(page))
        
        if let minLength = minLength {
            queryItems.append(.minLength(minLength))
        }
        
        if let maxLength = maxLength {
            queryItems.append(.maxLength(maxLength))
        }
        
        if let tags = tags {
            queryItems.append(.tags(tags, type))
        }
        
        if let authors = authors {
            queryItems.append(.authors(authors))
        }
        
        if let sortBy = sortBy {
            queryItems.append(.sortQuotesBy(sortBy))
        }
        
        if let order = order {
            queryItems.append(.order(order))
        }
        
        return queryItems
    }
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    static func quotes() async throws -> Quotes? {
        try await execute(with: QuotableEndpoint(.quotes))
    }
    
    @available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
    static func quotes(completion: @escaping (Result<Quotes?, Error>) -> ()) {
        execute(with: QuotableEndpoint(.quotes), completion: completion)
    }
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    static func randomQuote(minLength: Int? = nil,
                            maxLength: Int? = nil,
                            tags: [String]? = nil,
                            type: URLQueryItemListType = .all,
                            authors: [String]? = nil) async throws -> Quote? {
        
        let queryItems = randomQuoteParameters(minLength: minLength,
                                               maxLength: maxLength,
                                               tags: tags,
                                               type: type,
                                               authors: authors)
        
        return try await execute(with: QuotableEndpoint(.randomQuote, queryItems: queryItems))
    }
    
    @available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
    static func randomQuote(minLength: Int? = nil,
                            maxLength: Int? = nil,
                            tags: [String]? = nil,
                            type: URLQueryItemListType = .all,
                            authors: [String]? = nil,
                            completion: @escaping (Result<Quote?, Error>) -> ()) {
        
        let queryItems = randomQuoteParameters(minLength: minLength,
                                               maxLength: maxLength,
                                               tags: tags,
                                               type: type,
                                               authors: authors)
        
        return execute(with: QuotableEndpoint(.randomQuote, queryItems: queryItems), completion: completion)
    }
    
    @available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
    static private func randomQuoteParameters(minLength: Int? = nil,
                                              maxLength: Int? = nil,
                                              tags: [String]? = nil,
                                              type: URLQueryItemListType = .all,
                                              authors: [String]? = nil) -> [URLQueryItem] {
        
        var queryItems: [URLQueryItem] = []
        
        if let minLength = minLength {
            queryItems.append(.minLength(minLength))
        }
        
        if let maxLength = maxLength {
            queryItems.append(.maxLength(maxLength))
        }
        
        if let tags = tags {
            queryItems.append(.tags(tags, type))
        }
        
        if let authors = authors {
            queryItems.append(.authors(authors))
        }
        
        return queryItems
    }
}