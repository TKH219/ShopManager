//
//  PurchaseHistoryItem.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 12/26/20.
//

import SwiftUI

struct TransactionHistoryItem: View {
    @ObservedObject var model: TransactionHistoryItemModel
    init(model: TransactionHistoryItemModel) {
        self.model = model
    }
    
    var body: some View {
        NavigationView{
//            contentView
//                .padding(.all, 16.0)
//                .navigationBarTitle("Transaction", displayMode: .inline)
//                .navigationBarItems(
//                    leading: Button("Cancel", action: dismissView),
//                    trailing: Button("Done", action: {
//                        self.viewModel.onTapDoneButton()
//                        self.dismissView()
//                    }))
        }
    }
    
    
//    var nameView: some View {
//        Group {
//            if ((self.model.productName.isEmpty)) {
//                EmptyView()
//            } else {
//                Text(self.model.productName )
//                    .lineLimit(4)
//                    .multilineTextAlignment(TextAlignment.leading)
//            }
//        }
//    }
//
//    var descriptionView: some View {
//        Group {
//            if ((self.model.productDescription.isEmpty)) {
//                EmptyView()
//            } else {
//                Text(self.productItemModel.productDescription )
//                    .lineLimit(4)
//                    .multilineTextAlignment(TextAlignment.leading)
//            }
//        }
//    }
//
//    var originalPriceView: some View {
//        Group {
//            if (self.productItemModel.getOriginalPrice().isEmpty) {
//                EmptyView()
//            } else {
//                Text(self.productItemModel.getOriginalPrice())
//                    .lineLimit(1)
//            }
//        }
//    }
}



struct TransactionHistoryItem_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHistoryItem(model: TransactionHistoryItemModel())
    }
}
