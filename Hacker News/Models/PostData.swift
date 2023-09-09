//
//  PostData.swift
//  Hacker News
//
//  Created by Andrea Yong on 9/9/23.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID // computed property needs to be var
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
