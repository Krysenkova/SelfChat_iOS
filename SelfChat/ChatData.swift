//
//  ChatData.swift
//  SelfChat
//
//  Created by Masyschka on 1/28/22.
//
import Foundation

struct ChatData: Codable, Identifiable{
    enum CodingKeys: CodingKey {
            case participant
            case messages
        }
    let id = UUID()
    let participant: String
    var messages : [MessageData]?
}

struct MessageData: Codable, Hashable{
    var content : String
    var isSender: Bool
}
