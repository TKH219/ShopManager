//
//  BaseViewModel.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 12/10/20.
//

import SwiftUI

class BaseViewModel: ObservableObject, Identifiable {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func dismissView() {
        if (self.presentationMode.wrappedValue.isPresented) {
            presentationMode.wrappedValue.dismiss()
        }
      
    }
}
