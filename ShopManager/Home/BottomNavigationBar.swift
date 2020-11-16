//
//  BottomNavigationBar.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 11/13/20.
//

import SwiftUI

struct BottomNavigationBar: View {
    var body: some View {
        TabView {
                ProductManagerScreen()
                    .tabItem {
                        Image(systemName: "tray.2.fill")
                        Text("Storage")
                }
                Text("Friends Screen")
                    .tabItem {
                        Image(systemName: "megaphone.fill")
                        Text("Notification")
                }
                Text("Nearby Screen")
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                }
            }
    }
}
