//
//  MessageView.swift
//  SelfChat
//
//  Created by Masyschka on 1/27/22.
//

import SwiftUI

struct MessageView: View {
    @State var message: String = ""
    @State var isSender: Bool = true
    var body: some View {
        NavigationView {
            ZStack{
                Colors.light_gray.edgesIgnoringSafeArea(.all)
                ZStack{
                    Color.white
                    VStack{
                        HStack {
                            TextField("Message", text: $message)
                                .textFieldStyle(.roundedBorder).padding(.horizontal, 20)
                                .padding(.bottom, 10)
                            Button(action: {print("Pressed")}) {
                                Text(">")
                                    .frame(width: 30, height:30)
                                    .foregroundColor(Color.white).background(Colors.custom_blue)
                            }.clipShape(Circle())
                                .frame(width: 40, height: 40)
                                .padding(.horizontal, 20)
                        }
                        Divider()
                            .padding(.horizontal, 20)
                        HStack {
                            Toggle(isOn: $isSender){
                                Text("Sender")
                            }.padding(.horizontal, 20)
                        }
                    }
                    
                    
                }.padding(.top, 20)
            }
            
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
