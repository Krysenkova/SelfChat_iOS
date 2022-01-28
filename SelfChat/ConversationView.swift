//
//  ConversationView.swift
//  SelfChat
//
//  Created by Masyschka on 1/27/22.
//
import Foundation.NSString
import SwiftUI

struct ConversationView: View {
    let participants = ["Sherlock Holmes", "Jim Moriarty", "John Watson", "Mary Watson", "Molly Hooper", "Greg Lestrade"]
    let colors = [Colors.custom_brown, Colors.custom_orange, Colors.custom_blue, Colors.custom_light_blue, Colors.custom_red, Colors.custom_yellow]
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    ZStack {
                        Colors.conversation_background
                        VStack{
                            ForEach(0..<participants.count/2){ row in
                                HStack {
                                    ForEach(0..<2){column in
                                        NavigationLink(destination: ChatView(participant: self.participants[row*2+column])) {
                                            ContactCircle(text: getInitials(_name: self.participants[row*2+column]), color: self.colors[row*2+column]).padding(10)}
                                    }
                                }
                            }
                            
                        }
                    }.shadow(color: Color.gray, radius: 3, x: 0, y: 0)
                        .padding(.horizontal, 30)
                    
                    Text("HTW WiSe 21/22").padding(.bottom, 10)
                }
            }.navigationBarTitle("Conversation")
            
        }
    }
}

func getInitials(_name: String) -> String {
    let nameArray = _name.components(separatedBy: " ")
    let firstInitial = nameArray[0].prefix(1)
    let secondInitial = nameArray[1].prefix(1)
    return String(firstInitial+secondInitial)
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
