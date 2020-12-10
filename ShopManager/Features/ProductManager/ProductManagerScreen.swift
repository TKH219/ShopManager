//
//  ProductManagerScreen.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 11/13/20.
//

import SwiftUI
import Combine

struct ProductManagerScreen: View {
    
    @ObservedObject var viewModel: ProductManagerViewModel
    
    init() {
        self.viewModel = ProductManagerViewModel()
    }
    
    @State var isPushToAddNewProduct: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(self.viewModel.listData) { item in
                        ProductItemCell(model: item)
                            .padding(.zero)
                    }
                    .onDelete { (index) in
                        print("onDelete")
                    }
                }
                
            }
            .navigationBarTitle("Products", displayMode: .inline)
            .navigationBarItems(trailing: addButton)
        }
    }
}

private extension ProductManagerScreen {
    var addButton: some View {
        Button(action: {
            isPushToAddNewProduct = true
        }, label: {
            HStack(spacing: 10.0){
                Image(systemName: "plus")
                Text("Add")
                NavigationLink(destination: AddNewProduct(){
                    (model) in self.viewModel.listData.append(model)
                }, isActive: $isPushToAddNewProduct) { EmptyView() }
            }
        })
    }
    
    var emptySection: some View {
      Section {
        Text("No results")
          .foregroundColor(.gray)
      }
    }
}
