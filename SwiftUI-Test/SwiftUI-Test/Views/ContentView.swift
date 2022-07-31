//
//  ContentView.swift
//  SwiftUI-Test
//
//  Created by Лина Вертинская on 28.07.22.
//

import SwiftUI

struct ContentView: View {

    @State private var showingVideoView = false

    @ObservedObject var videoData = VideoModel()

    @EnvironmentObject var channelData: ChannelData

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                GeometryReader { geometry in
                    HStack(spacing: 20) {
                        NavigationLink(destination: ChannelView(), label: {
                            Text("Edit channel")
                        }).frame(width: geometry.size.width / 2 - 10, height: 50).accentColor(Color.init(#colorLiteral(red: 0.9921568657, green: 0.1764705882, blue: 0.3333333333, alpha: 1))).background(Color.init(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))).cornerRadius(10)
                        Button(action: {
                            print("12345")
                            self.showingVideoView.toggle()
                        }, label: {
                            Text("Edit content")
                        }).sheet(isPresented: self.$showingVideoView, content: {
                            VideoView(videoTitle: $videoData.title, videoDescription: $videoData.description).environmentObject(self.channelData)
                        }).frame(width: geometry.size.width / 2 - 10, height: 50).accentColor(Color.init(#colorLiteral(red: 0.9921568657, green: 0.1764705882, blue: 0.3333333333, alpha: 1))).background(Color.init(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))).cornerRadius(10)
                    }
                }.padding().frame(height: 50)
                //                Divider()
                HStack {
                    Image("heart").resizable().frame(width: 120, height: 120)
                    VStack(alignment: .leading) {
                        Text("Title: \(videoData.title)").font(.title)
                        Text("Description: \(videoData.description)").font(.subheadline).foregroundColor(.gray)
                    }
                }
                Spacer()
            }.padding()

                .navigationBarTitle("\(channelData.channelName)")
        }
        CellView()
    }
}

struct CircleShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .background(Circle()
                .fill(Color.white)
                .shadow(color: shadowColor, radius: shadowRadius))
    }
}

struct CellView: View {
    var body: some View {
        VStack {
            Text("my bird is flying south")
            Image("bird")
                .resizable()
                .frame(width: 80, height: 80)
                .modifier(CircleShadow(shadowColor: .orange, shadowRadius: 4))
            Text("my bird will return in the spring")
        }
        .multilineTextAlignment(.center)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
