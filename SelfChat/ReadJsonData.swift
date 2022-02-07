//
//  ReadJsonData.swift
//  SelfChat
//
//  Created by Masyschka on 1/28/22.
//

import Foundation
class ReadJsonData: ObservableObject  {
    @Published var chatData = [ChatData]() {
        didSet {
           loadDataFromDocumentDirectory()
        }
    }
    
    let fileManager = FileManager.default
    let fileName = "ChatsData.json"
    
    init(){
        loadDataFromDocumentDirectory()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "InitialValues", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        let data = try? Data(contentsOf: url)
        copy(data: data!)
    }
    
    func loadDataFromDocumentDirectory(){
        let url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        let data = try? Data(contentsOf: url)
        let chats = try? JSONDecoder().decode([ChatData].self, from: data!)
        if(chats!.isEmpty) {
            loadData()
        } else {self.chatData = chats!}
    }
    
    func copy(data: Data) {
        let url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        do {
            try data.write(to: url, options: .atomic)
        } catch {
            print(error)
        }
        let data = try? Data(contentsOf: url)
        let chats = try? JSONDecoder().decode([ChatData].self, from: data!)
        self.chatData = chats!
        
    }
}
