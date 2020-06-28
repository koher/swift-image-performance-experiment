//
//  ContentView.swift
//  SwiftImagePerformanceExperiment
//
//  Created by Yuta Koshizawa on 2020/06/28.
//  Copyright © 2020 koherent.org. All rights reserved.
//

import SwiftUI
import SwiftImage

struct ContentView: View {
    @State var showsImage: Bool = false
    
    @ViewBuilder
    var body: some View {
        if showsImage {
            Image(uiImage: loadImage())
                .resizable()
                .scaledToFit()
        } else {
            Button("Show Image") {
                self.showsImage = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
