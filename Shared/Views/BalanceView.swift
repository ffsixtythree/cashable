//
//  BalanceView.swift
//  Cashable
//
//  Created by Umid Saidov on 31/10/21.
//

import SwiftUI

struct BalanceView: View {
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 10) {
                Image(systemName: "arrow.down.circle.fill")
                    .renderingMode(.original)
                    .foregroundColor(.green)
                    .font(.system(size: 60))
                Text("Income")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("text"))
                VStack(alignment: .leading) {
                    Text("20,000 UZS")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                }
            }
            Spacer()
        }
        .padding(20)
        .background(Color("cell"))
        .cornerRadius(10)
    }
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView()
    }
}
