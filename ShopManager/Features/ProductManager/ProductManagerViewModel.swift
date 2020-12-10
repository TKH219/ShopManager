//
//  ProductManagerViewModel.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 12/9/20.
//

import Foundation

class ProductManagerViewModel: ObservableObject, Identifiable {
    @Published var listData: [ProductItemModel] = [
        ProductItemModel(productName: "Hello", count: 19, description: "This is description", originalPrice: 90000),
    ]
    
}
