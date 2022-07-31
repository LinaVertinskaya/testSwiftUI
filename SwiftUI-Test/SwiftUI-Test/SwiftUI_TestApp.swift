//
//  SwiftUI_TestApp.swift
//  SwiftUI-Test
//
//  Created by Лина Вертинская on 28.07.22.
//

import SwiftUI

@main
struct SwiftUI_TestApp: App {
    var body: some Scene {
        WindowGroup {
            let channelData = ChannelData()
            ContentView().environmentObject(channelData)
        }
    }
}
