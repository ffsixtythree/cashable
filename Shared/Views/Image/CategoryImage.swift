//
//  CategoryImage.swift
//  Cashable
//
//  Created by Umid Saidov on 01/11/21.
//

import SwiftUI

struct CategoryImage: View {
    
    let category: Category
    
    var body: some View {
        Image(systemName: category.systemNameIcon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(10)
            .foregroundColor(category.color)
            .background(category.color.opacity(0.1))
            .cornerRadius(5)
    }
}

struct CategoryImage_Previews: PreviewProvider {
    static var previews: some View {
        CategoryImage(category: .other)
    }
}
