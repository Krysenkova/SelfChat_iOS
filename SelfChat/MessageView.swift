//
//  MessageView.swift
//  SelfChat
//
//  Created by Masyschka on 1/27/22.
//

import SwiftUI

struct MessageView: View {
    var chatData: [ChatData]
    var participant: String
    @State var message: String = ""
    @State var isSender: Bool = true
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Colors.light_gray.edgesIgnoringSafeArea(.all)
            ZStack{
                Color.white
                VStack{
                    HStack(alignment: .center) {
                        TextField("Message", text: $message)
                            .textFieldStyle(.roundedBorder).padding(.horizontal, 20)
                            .padding(.bottom, 10)
                        Button(action: {
                            saveMessage(chatData: self.chatData, msg: self.message, isSender: self.isSender, participant: self.participant)
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image("paper-plane").resizable().padding(5)
                        }.clipShape(Circle()).frame(width: 40, height: 40)
                            .padding(.horizontal, 20)
                    }.padding(.top, 15)
                    Divider()
                        .padding(.horizontal, 20)
                    VStack {
                        Toggle(isOn: $isSender){
                            Text("Sender")
                        }.padding(.horizontal, 20)
                    }
                    Spacer()
                }
            }.padding(.top, 20)
        }.navigationBarHidden(true)
    }
}

func saveMessage(chatData:[ChatData], msg: String, isSender: Bool, participant: String) {
    var newChatData: [ChatData] = []
    var newMessages: [MessageData] = []
    var savedParticipants: [String] = []
    chatData.forEach {data in
        savedParticipants.append(data.participant)
        let msgs = data.messages
        if(data.participant == participant) {
            if(msgs != nil) {
                msgs?.forEach { message in
                    newMessages.append(message)
                }
            }
            newMessages.append(MessageData(content: msg, isSender: isSender))
            let chatDataItem = ChatData(participant: data.participant, messages: newMessages)
            newChatData.append(chatDataItem)
        }
        else {
            newChatData.append(data)
        }
    }
    if(!savedParticipants.contains(where: {$0 == participant})) {
        let chat = ChatData(participant: participant, messages: [MessageData(content: msg, isSender: isSender)])
        newChatData.append(chat)}
    do { try save(chatData: newChatData)} catch {}
    print(newChatData)
    
}


func save(chatData: [ChatData]) throws {
    guard let url = Bundle.main.url(forResource: "Values", withExtension: "json")
    else {
        print("Json file not found")
        return
    }
    try! JSONEncoder().encode(chatData).write(to: url, options: .atomic)
    let data = try? Data(contentsOf: url)
    ReadJsonData().copy(data: data!)
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        let message = MessageData(content: "preview", isSender: true)
        let messageArray = [message]
        let chatData = [ChatData(participant: "Previewer", messages: messageArray)]
        MessageView(chatData: chatData, participant: "Previewer")
    }
}

