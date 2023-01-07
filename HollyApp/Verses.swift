//
//  Verses.swift
//  HollyApp
//
//  Created by Никита Курюмов on 07.01.23.
//

import Foundation

let url = "https://rickandmortyapi.com/api/character"

struct Verses: Codable {
    let id: String
    let orgId: String
    let bibleId: String
    let bookId: String
    let chapterId: String
    let reference: String
}
