//
//  CashFlowImage.swift
//  Cashable
//
//  Created by Umid Saidov on 21/12/21.
//

import SwiftUI

struct CashFlowImage: View {
    
    var type: TransactionType
    var width: CGFloat
    var padding: CGFloat
    
    var body: some View {
        Image(systemName: type.systemNameIcon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: width)
            .padding(padding)
            .foregroundColor(.white)
            .background(type.color)
            .clipShape(Circle())
    }
}

struct CashFlowImage_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowImage(type: .expense, width: 20, padding: 10)
    }
}

