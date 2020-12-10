//
//  AddNewProduct.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 11/16/20.
//

import SwiftUI

struct AddNewProduct: View {
    @State var productItemModel: ProductItemModel = ProductItemModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var onAddProductItem: (ProductItemModel) -> ()?
    
    init(_ onAddProductItem: @escaping (ProductItemModel)->()) {
        self.onAddProductItem = onAddProductItem
    }
    
    var body: some View {
        contentView
            .padding(.all, 16.0)
            .onAppear(){
                UITableView.appearance().separatorStyle = .none
            }
            .navigationBarItems(trailing: Button(action: {
                self.onAddProductItem(self.productItemModel)
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Done")
            }))
            .navigationBarTitleDisplayMode(.inline)
    }
    
    var contentView: some View {
        ScrollView(.vertical) {
            VStack(alignment: HorizontalAlignment.leading) {
                InputFormView(title: "Product name:",
                              initText: self.productItemModel.productName,
                              placeHolder: "Enter product name",
                              { (value) in
                                self.productItemModel.productName = value
                              })
                countView
                originalPriceView
                InputFormView(title: "Description:",
                              initText: self.productItemModel.productDescription,
                              placeHolder: "Enter description",
                              { (value) in
                                self.productItemModel.productDescription = value
                              })
            }
        }
    }
    
    var countView: some View {
        HStack(alignment: VerticalAlignment.center) {
            Text("Count:")
                .padding(.zero)
            TextField(getInitText(textInit: self.productItemModel.getCount(), placeHolder: "Enter count"), text: Binding(get: {
                self.productItemModel.getCount()
            }, set: { (value) in
                self.productItemModel.setCount(count: value)
            }))
            .multilineTextAlignment(.trailing)
            .keyboardType(.phonePad)
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 10))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
        }
    }
    
    var originalPriceView: some View {
        HStack(alignment: VerticalAlignment.center) {
            Text("Original Price:")
                .padding(.zero)
            TextField(getInitText(textInit: self.productItemModel.getOriginalPrice(), placeHolder: "Enter original price"), text: Binding(get: {
                self.productItemModel.getOriginalPrice()
            }, set: { (value) in
                self.productItemModel.setOriginalPrice(price: value)
            }))
            .multilineTextAlignment(.trailing)
            .keyboardType(.decimalPad)
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 10))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
        }
    }
    
    func getInitText(textInit: String, placeHolder: String) -> String {
        if (textInit.isEmpty) {
            return placeHolder
        }
        
        return textInit
    }
}

struct InputFormView: View {
    @State var text: String = "0"
    var title: String = ""
    var onChangeText: (String) -> ()?
    var initText: String? = ""
    var placeHolder: String? = ""
    init(title: String, initText: String?, keyboardType: UIKeyboardType? = .default, placeHolder: String?, _ onChangeText: @escaping (String)->()) {
        self.title = title
        self.initText = initText
        self.onChangeText = onChangeText
        self.placeHolder = placeHolder
    }
    
    var body: some View {
        HStack(alignment: VerticalAlignment.center) {
            Text(self.title)
                .padding(.zero)
            TextEditor(text: $text)
                .multilineTextAlignment(.trailing)
                .lineLimit(4)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 10))
                .onChange(of: text) { (value) in
                    self.onChangeText(value)
                }
        }
        .onAppear() {
            viewAppear()
        }
    }
    
    func viewAppear() {
        self.text = getInitText()
    }
    
    func getInitText() -> String {
        if ((self.initText?.isEmpty) == nil) {
            return ""
        }
        
        return self.initText ?? ""
    }
}
