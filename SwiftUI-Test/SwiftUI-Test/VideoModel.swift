//
//  VideoModel.swift
//  SwiftUI-Test
//
//  Created by Лина Вертинская on 29.07.22.
//

import Combine

final class VideoModel: ObservableObject {
    @Published var title: String = "Heart"
    @Published var description: String = "Summer in my heart"
}
