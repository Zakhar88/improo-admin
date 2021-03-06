//
//  Categories.swift
//  ImprooAdmin
//
//  Created by 3axap on 16.03.16.
//  Copyright © 2016 GZZ. All rights reserved.
//

import Foundation

enum Categories {
    case ukrainian
    case english
    case russian

    var Books: [String] {
        switch self {
        case .ukrainian: return ["Мотивація", "Психологія", "Художні", "Творчість", "Комплексний розвиток", "Стосунки", "Кар'єра" ,"Спорт", "Харчування", "Здоров'я", "Філософія", "Соціум"]
        default: return []
        }
    }
//    enum Ukrainian {
//        static let Books = ["Мотивація", "Психологія", "Художні", "Творчість", "Комплексний розвиток", "Стосунки", "Кар'єра" ,"Спорт", "Харчування", "Здоров'я", "Філософія", "Соціум"]
//    }
//    enum English {
//    }
//    enum Russian {

    }
