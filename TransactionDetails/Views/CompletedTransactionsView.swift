//
//  CompletedTransactionsView.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 04/04/24.
//

import SwiftUI

struct CompletedTransactionsView: View {
    
    @State var transactions: [PendingDomainModel] = []
    
    private var viewModel = PendingTransactionsViewModel(userAccountRepo: UserAccountRepository(jsonRequestProtocol: JSONRequestManager()))
    
    var body: some View {
        
        VStack {
            ForEach(0..<transactions.count, id: \.self) { transactionIndex in
                HStack {
                    let dateString = transactions[transactionIndex].effectiveDate ?? ""
                    let dateFormat = Utility.formattedDateFromString(dateString: dateString, withFormat: "dd MMM yyyy") ?? ""
                    Text(dateFormat)
                    let newDate = dateString.toDate()
                    let days = Date().offsetFrom(date: newDate ?? Date())
                    Spacer()
                        .frame(minHeight: 0, maxHeight: 35)
                    Text(days)
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(Color(uiColor: .systemYellow))
                
                HStack {
                    let hasPrefix = transactions[transactionIndex].description?.hasPrefix("Wdl ATM CBA ATM") ?? false
                    if hasPrefix {
                        Image("FindUsIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    }
                    
                    let new = transactions[transactionIndex].description?.replacingOccurrences(of: "<br/>", with: "\n") ?? ""
                        Text("\(new)")
                            .fontWeight(.regular)
                    Spacer()
                    let data = transactions[transactionIndex].amount ?? 0.0
                    if data > 0.0 {
                        Text("$" + String(format:"%.02f", abs(transactions[transactionIndex].amount ?? 0.0)))
                    } else {
                        Text("-$" + String(format:"%.02f", abs(transactions[transactionIndex].amount ?? 0.0)))
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5))
            }
        }
        
        .onAppear(perform: {
            transactions = viewModel.getCompletedTransations()
        })
    }
}

#Preview {
    CompletedTransactionsView()
}
