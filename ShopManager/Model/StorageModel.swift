//
//  StorageModel.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 12/21/20.
//

import Foundation

class StorageModel: Identifiable, ObservableObject {
    var id: String = UUID().uuidString
    var listProduct: [ProductItemModel] = []
    var transactionHistory: [TransactionHistoryItemModel] = []
    var totalCapital: Double = 0.0
    var totalProfit: Double = 0.0
    var totalRevenue: Double = 0.0
    var users: [String] = []
    
    
}
