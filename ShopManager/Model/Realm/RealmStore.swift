//
//  RealmStore.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 12/12/20.
//

import Combine
import RealmSwift

class RealmStore : ObservableObject {
    var realm: Realm!
    
    static let sharedInstance: RealmStore = {
        let instance = RealmStore()
        do {
            let realm = try Realm()
            instance.realm = realm
        } catch let error {
            fatalError("Failed to open Realm. Error: \(error.localizedDescription)")
        }
        return instance
    }()
}

extension RealmStore {
    func createProduct(model: ProductItemModel) {
        objectWillChange.send()
        do {
            try realm.write {
                let realmModel = ProductItemRealmModel(model: model)
              realm.add(realmModel)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
