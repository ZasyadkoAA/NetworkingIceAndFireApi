//
//  IceAndFire.swift
//  NetworkingIceAndFireApi
//
//  Created by Александр Засядько on 19.09.2022.
//

import Foundation

struct Characters: Decodable {
    let name: String
    let gender: String
    let culture: String
    let born: String
    let died: String
    let titles: [String]
    let aliases: [String]
    let father: String
    let mother: String
    let spouse: String
    let allegiances: [String]
    let books: [String]
    let povBooks: [String]
    let tvSeries: [String]
    let playedBy: [String]
}
