//
//  TransactionDetailsTableView.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 03/04/24.
//

import SwiftUI

struct TransactionDetailsView: View {
    
    var body: some View {
        VStack {
            PendingDetailsView()
            CompletedTransactionsView()
            Spacer()
        }
    }
}

#Preview {
    TransactionDetailsView()
}
