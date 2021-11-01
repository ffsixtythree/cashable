//
//  CategoryView.swift
//  Cashable
//
//  Created by Umid Saidov on 30/10/21.
//

import SwiftUI

struct CategoryRow: View {
    
    var body: some View {
        HStack {
            HStack(spacing: 10) {
                CategoryImage(category: .shopping)
                Text("Fuel")
                    .fontWeight(.medium)
                    .font(.body)
                    .foregroundColor(Color("text"))
            }
            Spacer()
            Text("20,000 UZS")
                .foregroundColor(.green)
                .font(.body)
                .fontWeight(.semibold)
                .frame(width: 130, alignment: .trailing)
                .lineLimit(1)
        }
        .padding(.top, 10)
        .padding(.bottom, 10)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow()
            .previewLayout(.sizeThatFits)
    }
}
