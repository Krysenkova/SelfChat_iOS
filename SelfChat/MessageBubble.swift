//
//  MessageBubble.swift
//  SelfChat
//
//  Created by Masyschka on 1/25/22.
//

import SwiftUI

struct MessageBubble: View {
    let message : MessageData
    
    var background: Color {
        if(message.isSender) {
            return Color.accentColor
        } else {
            return Colors.inactive_message
        }
    }
    var foreground: Color {
        if(message.isSender) {
            return Color.white
        } else {
            return Color.black
        }
    }
    
    var body: some View {
        HStack {
            if(message.isSender) {
                HStack() {
                    Spacer()
                    Text(message.content)
                        .padding(10)
                        .foregroundColor(foreground)
                        .background(background)
                        .cornerRadius(24)
                }.padding(.horizontal, 5)
            }
            if (!message.isSender) {
                HStack() {
                    Text(message.content)
                        .padding(10)
                        .foregroundColor(foreground)
                        .background(background)
                        .cornerRadius(24)
                    Spacer()
                }.padding(.horizontal, 5)
            }
        }.frame(maxWidth: .infinity)
    }
}
struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: MessageData(content: "Blabla", isSender: true))
    }
}
