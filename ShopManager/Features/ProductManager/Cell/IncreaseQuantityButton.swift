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
    var countInit: Int
    init(countNumber: Int, _ changeCount: ChangeCountCallBack?) {
        self.changeCount = changeCount
        self.countInit = countNumber
    }
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.trailing) {
            HStack(alignment: VerticalAlignment.center, spacing: 10) {
                plusButton
                textFieldForNumber
                minusButton
            }
        }
        .onAppear(){
            viewAppear()
        }
    }
    
    func viewAppear() {
        self.count = countInit
    }
    
    var textFieldForNumber: some View {
        TextField("\(String.init(self.count))", text: Binding(get: {
            String.init(self.count)
        }, set: { (text) in
            self.count = Int.init(text) ?? 0
            if let changeCount = self.changeCount {
                changeCount(text)
            }
        }))
        .keyboardType(.phonePad)
        .padding(.vertical, 5)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
    var plusButton: some View {
        Button(
            action: {
                self.count += 1
                if let changeCount = self.changeCount {
                    changeCount(String.init(count))
                }
            }, label: {
                Image(systemName: "plus")
                    .foregroundColor(.red)
                    .padding(.all, 12)
                    .frame(width: 40, height: 40, alignment: .center)
                
            })
            .buttonStyle(PlainButtonStyle())
        
    }
    
    var minusButton: some View {
        Button(
            action: {
                self.count -= 1
                if let changeCount = self.changeCount {
                    changeCount(String.init(count))
                }
            }, label: {
                Image(systemName: "minus")
                    .foregroundColor(.red)
                    .padding(.all, 12)
                    .frame(width: 40, height: 40, alignment: .center)
            })
            .buttonStyle(PlainButtonStyle())
    }
}
