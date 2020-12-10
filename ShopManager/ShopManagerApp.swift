//
//  ShopManagerApp.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 11/12/20.
//

import SwiftUI
import Firebase
import IQKeyboardManagerSwift

@main
struct ShopManagerApp: App {
    
    init() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Done"
    }
    
    var body: some Scene {
        WindowGroup {
            BottomNavigationBar()
        }
    }
}
