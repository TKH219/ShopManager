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
    @State var isPushToAddNewProduct: Bool = false
    
    init() {
        self.viewModel = ProductManagerViewModel()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(self.viewModel.listData) { item in
                        ProductItemCell(model: item)
                            .padding(.zero)
                            .onTapGesture(perform: {
                                isPushToAddNewProduct = true
                            })
                            .sheet(isPresented: $isPushToAddNewProduct) {
                                AddNewProduct(model: item){ model in
                                    isPushToAddNewProduct = false
                    //                RealmStore.sharedInstance.createProduct(model: model)
                                }
                            }
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

extension ProductManagerScreen {
    
    var addButton: some View {
        Button(action: {
            isPushToAddNewProduct = true
        }, label: {
            HStack(spacing: 10.0){
                Image(systemName: "plus")
                Text("Add")
//                NavigationLink(destination: AddNewProduct(){ model in
//                    RealmStore.sharedInstance.createProduct(model: model)
//                }, isActive: $isPushToAddNewProduct) { EmptyView() }
            }
        }).sheet(isPresented: $isPushToAddNewProduct) {
            AddNewProduct(model: ProductItemModel()){ model in
                isPushToAddNewProduct = false
//                RealmStore.sharedInstance.createProduct(model: model)
            }
        }
    }
    
    var emptySection: some View {
      Section {
        Text("No results")
          .foregroundColor(.gray)
      }
    }
}

struct ProductManagerScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductManagerScreen()
    }
}
