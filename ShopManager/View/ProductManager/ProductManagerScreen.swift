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
    var body: some View {
        NavigationView {
                    VStack {
                        List(listData) { item in
                            ProductItemCell(model: item)
                        }.padding(EdgeInsets(top: 16.0, leading: 16.0, bottom: 16.0, trailing: 16.0))
                        HStack {
                            Button(action: {
                            }) {
                                Image(systemName: "someimage")
                            }
                            Spacer()
                            Button(action: {
                            }) {
                                Image(systemName: "someimage")
                            }
                        }
                    }
                    .navigationBarTitle(Text("Products")).navigationBarItems(trailing: Button(action: {
                        print("testttt")
                    }, label: {
                        HStack(spacing: 10.0){
                            Image(systemName: "plus")
                            Text("Add")
                        }
                    }))
                }
    }
}
