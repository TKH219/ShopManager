//
//  ProductItemModel.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 11/13/20.
//

import Foundation

class ProductItemModel: Equatable, Identifiable, ObservableObject {
    @Published var productName: String!
    @Published var productId: String!
    @Published var count: Int!
    
    static func == (lhs: ProductItemModel, rhs: ProductItemModel) -> Bool {
        return (lhs.productName == lhs.productName &&
                    lhs.productId == lhs.productId &&
                    lhs.count == lhs.count)
    }
    
    convenience init(productName: String, productId: String, count: Int) {
        self.init()
        self.productName = productName
        self.productId = productId
        self.count = count
    }
    
    func setCount(count: String) {
        if (!count.isEmpty) {
            self.count = Int.init(count)
        }
    }
}
