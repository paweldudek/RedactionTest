//
//  ContentView.swift
//  RedactionTest
//
//  Created by Pawel Dudek on 30/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var enableRedaction: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                CellContentView()
                    .padding(.top, enableRedaction ? 200 : 8)
                CellContentView()
                Button("Flip") {
                    enableRedaction.toggle()
                }
            }
            .redacted(reason: enableRedaction ? [.placeholder] : [])
            .padding()
        }
        .animation(.default, value: enableRedaction)
    }
    
    struct CellContentView: View {
        var body: some View {
            HStack {
                VStack {
                    Text("Header")
                    Text("Subtitle")
                }
                Spacer()
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }
            .padding()
            .background(Color(uiColor: .secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerSize: .init(width: 16, height: 16)))
        }
    }
}

#Preview {
    ContentView()
}
