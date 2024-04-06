//
//  PendingDetailsView.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 04/04/24.
//

import SwiftUI

struct PendingDetailsView: View {
    @State var pendings: [PendingDomainModel] = []
    
    private var viewModel = PendingTransactionsViewModel(userAccountRepo: UserAccountRepository(jsonRequestProtocol: JSONRequestManager()))
    
    var body: some View {
        
        VStack {
            ForEach(0..<pendings.count, id: \.self) { pending in
                HStack {
                    let dateString = pendings[pending].effectiveDate ?? ""
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
                    if let new = pendings[pending].description?.replacingOccurrences(of: "<br/>", with: "\n") {
                        Text("**PENDING:** \(new)")
                            .fontWeight(.regular)
                    } else {
                        Text("")
                    }
                    Spacer()
                    Text("-$" + String(format:"%.02f", abs(pendings[pending].amount ?? 0.0)))
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5))
            }
        }
        
        .ignoresSafeArea()
        .frame(minHeight: 0, maxHeight: CGFloat(pendings.count) * 185)
        .onAppear(perform: {
            viewModel.getPendingTransactions { pendings in
                self.pendings = pendings
            }
        })
    }
}

#Preview {
    PendingDetailsView()
}
