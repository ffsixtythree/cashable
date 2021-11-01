//
//  CardView.swift
//  Cashable
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI

struct AccountView: View {
    
    var type: AccountType
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                AccountImage(type: type)
                Text(type.rawValue.capitalized)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                VStack(alignment: .leading) {
                    Text("20,000")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("text"))
                    Text("UZS")
                        .font(.title2)
                        .fontWeight(.regular)
                        .foregroundColor(Color("text"))
                }
            }
            Spacer()
        }
        .lineLimit(1)
        .padding(20)
        .background(Color("cell"))
        .cornerRadius(10)
        .aspectRatio(1 / 1, contentMode: .fill)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(type: .balance)
            .previewLayout(.sizeThatFits)
    }
}
