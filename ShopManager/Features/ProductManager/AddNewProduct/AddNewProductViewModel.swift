//
//  AddNewProductViewModel.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 12/10/20.
//

import SwiftUI

class AddNewProductViewModel: BaseViewModel {
    
    @Published var productItemModel: ProductItemModel = ProductItemModel()
    
    init(model: ProductItemModel) {
        self.productItemModel = model
    }
    
    func onTapDoneButton() {
        RealmStore.sharedInstance.createProduct(model: productItemModel)
    }
}
