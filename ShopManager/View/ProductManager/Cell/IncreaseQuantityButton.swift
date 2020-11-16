//
//  IncreaseQuantityButton.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 11/15/20.
//

import SwiftUI
typealias ChangeCountCallBack = (_ count: String) -> Void

struct IncreaseQuantityButton: View {
    @State var count: Int = 0
    var changeCount: ChangeCountCallBack!
    init(count: Int, _ changeCount: ChangeCountCallBack?) {
        self.count = count
        self.changeCount = changeCount
    }
    
    var body: some View {
        HStack(spacing: 10.0) {
            Button(action: {
                self.count += 1
                if let changeCount = self.changeCount {
                    changeCount(String.init(count))
                }
            }, label: {
                HStack(spacing: 10.0){
                    Image(systemName: "plus")
                }
            }).buttonStyle(PlainButtonStyle())
            Spacer()
            TextField("\(String.init(self.count))", text: Binding(get: {
                String.init(self.count)
            }, set: { (text) in
                if let changeCount = self.changeCount {
                    changeCount(text)
                }
            })).keyboardType(.phonePad)
            
            Button(action: {
                self.count -= 1
                if let changeCount = self.changeCount {
                    changeCount(String.init(count))
                }
            }, label: {
                HStack(spacing: 10.0){
                    Image(systemName: "minus")
                }
            }).buttonStyle(PlainButtonStyle())
        }.padding(EdgeInsets(top: 10.0, leading: 0.0, bottom: 10.0, trailing: 16.0))
    }
}
