//
//  ProductManagerScreen.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 11/13/20.
//

import SwiftUI

struct ProductManagerScreen: View {
    
    var listData: [ProductItemModel]

    init() {
        listData = [
            ProductItemModel(productName: "Hello", productId: "111", count: 19),
            ProductItemModel(productName: "Hello", productId: "111", count: 19),
            ProductItemModel(productName: "Hello", productId: "111", count: 19),
            ProductItemModel(productName: "Hello", productId: "111", count: 19),
            ProductItemModel(productName: "Hello", productId: "111", count: 19),
            ProductItemModel(productName: "Hello", productId: "111", count: 19),
            ProductItemModel(productName: "Hello", productId: "111", count: 19),
            ProductItemModel(productName: "Hello", productId: "111", count: 19),
            ProductItemModel(productName: "Hello", productId: "111", count: 19),
            ProductItemModel(productName: "Hello", productId: "111", count: 19),
            ProductItemModel(productName: "Hello", productId: "111", count: 19),
            ProductItemModel(productName: "Hello", productId: "111", count: 19),
            ProductItemModel(productName: "Hello", productId: "111", count: 19),
            ProductItemModel(productName: "Hello", productId: "111", count: 19),
            ProductItemModel(productName: "Hello", productId: "111", count: 19)
        ]
    }
    
    @State var isPushToAddNewProduct: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                List(listData) { item in
                    ProductItemCell(model: item)
                }.padding(EdgeInsets(top: 16.0, leading: 16.0, bottom: 16.0, trailing: 16.0))
            }
            .navigationBarTitle(Text("Products"))
            .navigationBarItems(trailing: Button(action: {
                print("testttt")
                isPushToAddNewProduct = true
            }, label: {
                HStack(spacing: 10.0){
                    Image(systemName: "plus")
                    Text("Add")
                    NavigationLink(destination: AddNewProduct(), isActive: $isPushToAddNewProduct) { EmptyView() }
                }
            }))
        }
    }
}

