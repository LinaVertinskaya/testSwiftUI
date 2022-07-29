//
//  ChannelView.swift
//  SwiftUI-Test
//
//  Created by Лина Вертинская on 28.07.22.
//

import SwiftUI

struct ChannelView: View {

    @EnvironmentObject var channelData: ChannelData

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Channel Name", text: $channelData.channelName)
                Divider()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Dismiss this VC")
                })
                Spacer()
            }.padding()
                .navigationBarTitle("\(channelData.channelName)")
        }
    }
}

struct ChannelView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelView()
    }
}
