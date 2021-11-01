//
//  AccountImage.swift
//  Cashable
//
//  Created by Umid Saidov on 01/11/21.
//

import SwiftUI

struct AccountImage: View {
    
    var type: AccountType
    
    var body: some View {
        Image(systemName: type.systemNameIcon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(10)
            .foregroundColor(type.color)
            .background(type.color.opacity(0.1))
            .clipShape(Circle())
    }
}

struct AccountImage_Previews: PreviewProvider {
    static var previews: some View {
        AccountImage(type: .reserve)
    }
}
