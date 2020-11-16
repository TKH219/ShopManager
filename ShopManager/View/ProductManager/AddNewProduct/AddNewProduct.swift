//
//  AddNewProduct.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 11/16/20.
//

import SwiftUI

struct AddNewProduct: View {
    @State var productItemModel: ProductItemModel?
    init() {
        self.productItemModel = ProductItemModel()
    }
    var body: some View {
        VStack() {
            TextField("Enter product name...", text: Binding(get: {
                productItemModel?.productName ?? ""
            }, set: { (text) in
                productItemModel?.productName = text
            }))
            TextField("Enter product id...", text: Binding(get: {
                productItemModel?.productId ?? ""
            }, set: { (text) in
                productItemModel?.productId = text
            }))
            
            TextField("Enter count...", text: Binding(get: {
                String.init(self.productItemModel?.count ?? 0)
            }, set: { (text) in
                self.productItemModel?.setCount(count: text)
            })).keyboardType(.phonePad)
        }
    }
}
