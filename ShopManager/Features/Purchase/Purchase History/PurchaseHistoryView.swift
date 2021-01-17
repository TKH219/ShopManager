//
//  PurchaseHistoryView.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 12/21/20.
//

import SwiftUI

struct PurchaseHistoryView: View {
    @State var text = "Hello World"
    var body: some View {
        NavigationView {
            List {
                Text("List Data Right Here")
            }
                .navigationTitle("Purchase Transaction")
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button(action: toggleSidebar, label: {
                            Image(systemName: "sidebar.left")
                        })
                    }
                }
        }
    }
    
    private func toggleSidebar() {
            #if os(iOS)
            #else
            NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
            #endif
        }
}

struct PurchaseHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseHistoryView()
    }
}
