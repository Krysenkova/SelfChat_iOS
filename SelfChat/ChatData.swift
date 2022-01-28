//
//  ChatData.swift
//  SelfChat
//
//  Created by Masyschka on 1/28/22.
//
import Foundation

struct ChatData: Codable, Identifiable {
    enum CodingKeys: CodingKey {
            case participant
            case messages
        }
    let id = UUID()
    let participant: String
    let messages : [MessageData]?
}

struct MessageData: Codable, Hashable{
    let content : String
    let isSender: Bool
}

