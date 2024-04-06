//
//  BalanceDetailsView.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 03/04/24.
//

import SwiftUI

struct BalanceDetailsView: View {
    @StateObject private var viewModel = BalanceDetailsViewModel(accountDetailsProtocol: AccountDetailsRepository(userAccountProtocol: UserAccountRepository(jsonRequestProtocol: JSONRequestManager())))
    var body: some View {
        ZStack(alignment: .leading, content: {
            Rectangle()
                .fill(Color(uiColor: UIColor(red: 0, green: 24, blue: 10, alpha: 0.2)))
                .ignoresSafeArea()
            Rectangle()
                .fill(Color.white)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            VStack(alignment: .trailing) {
                HStack {
                    Image("accountsimagetransactional")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 5))
                    VStack(alignment: .leading) {
                        Text("\(viewModel.getAccountName())")
                        Text("\(viewModel.getAccountNumber())")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                VStack(alignment: .center, spacing: 10) {
                    HStack(spacing: 50) {
                        Text("Available funds")
                            .padding(.leading, 30)
                        Text("\(viewModel.getAvailableFunds())")
                    }
                    .shadow(radius: 10)
                    HStack(spacing: 35) {
                        Text("Available balance")
                            .padding(.leading, 30)
                        Text("\(viewModel.getAvailableBalance())")
                        
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20))
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color(uiColor: .systemGray6))
            }
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        })
    }
}

#Preview {
    BalanceDetailsView()
}
