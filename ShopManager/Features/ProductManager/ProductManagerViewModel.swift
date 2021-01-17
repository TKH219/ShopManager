//
//  ProductManagerViewModel.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 12/9/20.
//

import RealmSwift

class ProductManagerViewModel: BaseViewModel {
    var listData: [ProductItemModel] {
        dataFromRealm.map(ProductItemModel.init)
    }

    var dataFromRealm: Results<ProductItemRealmModel>
    
    override init() {
        dataFromRealm = RealmStore.sharedInstance.realm.objects(ProductItemRealmModel.self)
    }
}
