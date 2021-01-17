//
//  AddNewProduct.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 11/16/20.
//

import SwiftUI

struct AddNewProduct: View {
    @ObservedObject var viewModel: AddNewProductViewModel
    @Environment(\.presentationMode) var presentationMode
    var onAddProductItem: (ProductItemModel) -> ()?
    
    init(model: ProductItemModel, _ onAddProductItem: @escaping (ProductItemModel)->()) {
        self.viewModel = AddNewProductViewModel(model: model)
        self.onAddProductItem = onAddProductItem
    }
    
    var body: some View {
        NavigationView{
            contentView
                .padding(.all, 16.0)
                .navigationBarTitle("Product Item", displayMode: .inline)
                .navigationBarItems(
                    leading: Button("Cancel", action: dismissView),
                    trailing: Button("Done", action: {
                        self.viewModel.onTapDoneButton()
                        self.dismissView()
                    }))
        }
    }
    
    var contentView: some View {
        Form {
            InputFormView(title: "Product name",
                          initText: self.viewModel.productItemModel.productName,
                          placeHolder: "Enter product name",
                          { (value) in
                            self.viewModel.productItemModel.productName = value
                          })
            countView
            originalPriceView
            Section(header: Text("Description 📝")) {
                InputFormView(title: "Description:",
                              initText: self.viewModel.productItemModel.productDescription,
                              placeHolder: "Enter description",
                              { (value) in
                                self.viewModel.productItemModel.productDescription = value
                              })
            }
        }
        
    }
    
    
    
    func getInitText(textInit: String, placeHolder: String) -> String {
        if (textInit.isEmpty) {
            return placeHolder
        }
        
        return textInit
    }
}

private extension AddNewProduct {
    
    func dismissView() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var countView: some View {
        HStack(alignment: VerticalAlignment.center) {
            Text("Count:").padding(.zero)
            TextField(getInitText(textInit: self.viewModel.productItemModel.getCount(), placeHolder: "Enter count"), text: Binding(get: {
                self.viewModel.productItemModel.getCount()
            }, set: { (value) in
                self.viewModel.productItemModel.setCount(count: value)
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
            TextField(getInitText(textInit: self.viewModel.productItemModel.getOriginalPrice(), placeHolder: "Enter original price"), text: Binding(get: {
                self.viewModel.productItemModel.getOriginalPrice()
            }, set: { (value) in
                self.viewModel.productItemModel.setOriginalPrice(price: value)
            }))
            .multilineTextAlignment(.trailing)
            .keyboardType(.decimalPad)
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 10))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
        }
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
struct AddNewProduct_Previews: PreviewProvider {
    static var previews: some View {
        AddNewProduct(model: ProductItemModel(), { model in print("")})
        }
    }

