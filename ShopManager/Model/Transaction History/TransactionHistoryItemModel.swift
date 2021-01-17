//
//  TransactionHistoryItemModel.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 12/21/20.
//

import Foundation

class TransactionHistoryItemModel: Identifiable, ObservableObject {
    
    var id: String = UUID().uuidString
    var productId: String = ""
    var count: Int = 0
    var countRemaining: Int = 0
    var totalPrice: Double = 0.0
    var noted: String = ""
    var price: Double = 0.0
    var revenue: Double = 0.0
}
