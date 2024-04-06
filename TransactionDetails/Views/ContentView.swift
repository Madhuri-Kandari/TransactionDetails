//
//  ContentView.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 03/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Account Details")
                    .fontWeight(.bold)
                    .font(.title)
                ScrollView(.vertical, showsIndicators: false) {
                    BalanceDetailsView()
                        .frame(minHeight: 200)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
