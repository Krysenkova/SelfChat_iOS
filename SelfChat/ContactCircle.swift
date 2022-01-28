//
//  ContactCircle.swift
//  SelfChat
//
//  Created by Masyschka on 1/27/22.
//

import SwiftUI

struct ContactCircle: View {
    var text: String
    var color: Color
    var body: some View {
        ZStack {
            Circle().fill(Color.white)
                .frame(width:100, height:100)
            Circle().fill(color).frame(width:85, height:85)
            Text(text)
                .foregroundColor(Color.white)
                .font(.system(size: 30))
            Button(action: {print("Pressed" + text)
            }) {
            }.clipShape(Circle())
                .frame(width: 85, height: 85)
                .padding(.horizontal, 20)
            
        }
    }
}
struct ContactCircle_Previews: PreviewProvider {
    static var previews: some View {
        ContactCircle(text: "AA", color: Colors.custom_yellow)
    }
}

