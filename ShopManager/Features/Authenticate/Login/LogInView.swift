//
//  LogInView.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 11/16/20.
//

import SwiftUI

struct LogInView: View {
    @State var phoneNumber: String = ""
    var body: some View {
        VStack() {
            TextField("Enter phone number...", text: Binding(get: {
                phoneNumber
            }, set: { (text) in
                phoneNumber = text
            })).keyboardType(.phonePad)
        }
    }
}
