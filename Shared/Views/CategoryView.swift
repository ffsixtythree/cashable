//
//  CategoryView.swift
//  Cashable
//
//  Created by Umid Saidov on 30/10/21.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Image(systemName: "cross.circle.fill")
                .renderingMode(.original)
                .foregroundColor(.red)
                .font(.system(size: 60))
            Text("Health")
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(Color("text"))
            Text("200,000 UZS")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.green)
        }
        .aspectRatio(1 / 1, contentMode: .fit)
        .cornerRadius(10)
        .padding()
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
            .previewLayout(.sizeThatFits)
    }
}
