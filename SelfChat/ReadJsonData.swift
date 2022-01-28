//
//  ReadJsonData.swift
//  SelfChat
//
//  Created by Masyschka on 1/28/22.
//

import Foundation
class ReadJsonData: ObservableObject  {
    @Published var chatData = [ChatData]()
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "Chats", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        let chats = try? JSONDecoder().decode([ChatData].self, from: data!)
        self.chatData = chats!
        
    }
     
}
