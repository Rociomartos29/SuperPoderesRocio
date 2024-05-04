//
//  HerosModel.swift
//  SuperPoderesRocio
//
//  Created by Rocio Martos on 26/4/24.
//

import Foundation
// MARK: - SuperHeroResponse
struct SuperHeroResponse: Codable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: SuperHeroData
}

// MARK: - SuperHeroData
struct SuperHeroData: Codable {
    let offset, limit, total, count: Int
    let results: [SuperHero]
}

// MARK: - SuperHero
struct SuperHero: Codable, Identifiable {
    let id: Int
    let name, description, modified: String
    let thumbnail: SuperHeroThumbnail
    let resourceURI: String
    let comics, series, stories, events: SuperHeroComics
    let urls: [SuperHeroURLElement]
}

// MARK: - SuperHeroComics
struct SuperHeroComics: Codable {
    let available: Int
    let collectionURI: String
    let items: [SuperHeroComicsItem]
    let returned: Int
}

// MARK: - SuperHeroComicsItem
struct SuperHeroComicsItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - SuperHeroStories
struct SuperHeroStories: Codable {
    let available: Int
    let collectionURI: String
    let items: [SuperHeroStoriesItem]
    let returned: Int
}

// MARK: - SuperHeroStoriesItem
struct SuperHeroStoriesItem: Codable {
    let resourceURI: String
    let name: String
    let type: SuperHeroItemType
}

enum SuperHeroItemType: String, Codable {
    case cover = "cover"
    case interiorStory = "interiorStory"
}

// MARK: - SuperHeroThumbnail
struct SuperHeroThumbnail: Codable {
    let path: String
    let `extension`: String

    enum CodingKeys: String, CodingKey {
        case path
        case `extension` = "extension"
    }
}

// MARK: - SuperHeroURLElement
struct SuperHeroURLElement: Codable {
    let type: SuperHeroURLType
    let url: String
}

enum SuperHeroURLType: String, Codable {
    case comiclink, detail, wiki
}

// MARK: - SuperHeroFilter
struct SuperHeroFilter: Codable {
    let name: String
}
