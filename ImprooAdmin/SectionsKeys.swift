//
//  Chapters.swift
//  ImprooAdmin
//
//  Created by 3axap on 16.03.16.
//  Copyright © 2016 GZZ. All rights reserved.
//

import Foundation

enum Languages: String {
    case Ukrainian = "Ukrainian"
    case English = "English"
    case Russian = "Russian"
    
    static let allLanguages = [Ukrainian.rawValue, English.rawValue, Russian.rawValue]
}

enum Chapters: String {
    case Books = "Books"
    case Events = "Events"
    case Activities = "Activities"
    case Resources = "Resources"
    case Food = "Food"
    case Entertainment = "Entertainment"
    case Sport = "Sport"
    case Career = "Career"
    case News = "News"

    static let allChapters = [Books.rawValue, Events.rawValue, Activities.rawValue, Resources.rawValue, Food.rawValue, Entertainment.rawValue, Sport.rawValue, Career.rawValue, News.rawValue]
}


