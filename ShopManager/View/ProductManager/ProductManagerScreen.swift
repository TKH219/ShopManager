//
//  ProductManagerScreen.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 11/13/20.
//

import SwiftUI

struct ProductManagerScreen: View {
    
    @State var listData: [ProductItemModel] = [
        ProductItemModel(productName: "Hello", count: 19, description: "This is description", originalPrice: 90000),
    ]
    
    @State var isPushToAddNewProduct: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(self.listData) { item in
                        ProductItemCell(model: item)
                            .padding(.zero)
                    }
                    .onDelete { (index) in
                        print("onDelete")
                    }
                }
                
            }
            .navigationBarTitle(Text("Products"))
            .navigationBarItems(trailing: addButton)
        }
    }
    
    var addButton: some View {
        Button(action: {
            isPushToAddNewProduct = true
        }, label: {
            HStack(spacing: 10.0){
                Image(systemName: "plus")
                Text("Add")
                NavigationLink(destination: AddNewProduct(){
                    (model) in self.listData.append(model)
                }, isActive: $isPushToAddNewProduct) { EmptyView() }
            }
        })
    }
}

