//
//  ChatView.swift
//  SelfChat
//
//  Created by Masyschka on 1/27/22.
//

import SwiftUI


struct ChatView: View {
    @ObservedObject var datas = ReadJsonData()
    let participant: String
    
    var body: some View {
        VStack{
            ZStack{
                Colors.light_gray.edgesIgnoringSafeArea(.all)
                VStack{
                    
                    List(datas.chatData){chat in
                        if(chat.participant == self.participant && chat.messages != nil) {
                            ForEach(chat.messages!, id: \.self){ msg in
                                MessageBubble(message: msg)}
                        }
                    }
                }
                
                
                
            }.padding(.bottom, 70)
                .shadow(color: Color.gray, radius: 3, x: 0, y: 0)
            HStack{
                Spacer()
                Button(action: {print("Pressed")}) {
                    Text("+").frame(width: 60, height:60)
                        .foregroundColor(Color.white).background(Colors.custom_blue)
                }.clipShape(Circle())
                    .frame(width: 60, height: 60)
                
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
            
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(participant: "SherlockHolmes")
    }
}
