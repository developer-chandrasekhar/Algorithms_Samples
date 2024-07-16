//
//  ContentView.swift
//  OperationQueueSample
//
//  Created by chandra sekhar p on 13/07/24.
//

import SwiftUI

struct ContentView: View {
    @State var queue: OperationQueueTest?
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear {
            self.queue = OperationQueueTest()
            self.queue?.execute()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
