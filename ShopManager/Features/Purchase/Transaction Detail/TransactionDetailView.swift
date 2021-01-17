//
//  TransactionDetailView.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 12/26/20.
//

import SwiftUI

struct TransactionDetailView: View {
    @ObservedObject var model: TransactionHistoryItemModel
    init(model: TransactionHistoryItemModel) {
        self.model = model
    }
    
    var body: some View {
        Text("Hello, World!")
    }
    
    
    
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailView(model: TransactionHistoryItemModel())
    }
}
