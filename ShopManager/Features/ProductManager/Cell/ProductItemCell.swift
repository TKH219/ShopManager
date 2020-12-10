//
//  ProductItemCell.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 11/13/20.
//

import SwiftUI

struct ProductItemCell: View {
    
    @ObservedObject var productItemModel: ProductItemModel
    
    init(model: ProductItemModel) {
        self.productItemModel = model
    }
    
    
    var body: some View {
        Group {
            if (shouldShowIncreaseButton()) {
                VStack(alignment: HorizontalAlignment.leading) {
                    nameView
                    descriptionView
                    originalPriceView
                    IncreaseQuantityButton(countNumber: self.productItemModel.count ) { (value) in
                        self.productItemModel.setCount(count: value)
                    }
                    }
            } else {
                EmptyView()
            }
        }
    }
    
    var nameView: some View {
        Group {
            if ((self.productItemModel.productName.isEmpty)) {
                EmptyView()
            } else {
                Text(self.productItemModel.productName )
                    .lineLimit(4)
                    .multilineTextAlignment(TextAlignment.leading)
            }
        }
    }
    
    var descriptionView: some View {
        Group {
            if ((self.productItemModel.productDescription.isEmpty)) {
                EmptyView()
            } else {
                Text(self.productItemModel.productDescription )
                    .lineLimit(4)
                    .multilineTextAlignment(TextAlignment.leading)
            }
        }
    }
    
    var originalPriceView: some View {
        Group {
            if (self.productItemModel.getOriginalPrice().isEmpty) {
                EmptyView()
            } else {
                Text(self.productItemModel.getOriginalPrice())
                    .lineLimit(1)
            }
        }
    }
    
    func shouldShowIncreaseButton() -> Bool {
        return !((self.productItemModel.getOriginalPrice().isEmpty) && ((self.productItemModel.productDescription.isEmpty) == nil) && ((self.productItemModel.productName.isEmpty) == nil))
    }
}