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
                        Image(systemName: "heart.fill")
                        Text("Favourites")
                }
                Text("Friends Screen")
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Friends")
                }
                Text("Nearby Screen")
                    .tabItem {
                        Image(systemName: "mappin.circle.fill")
                        Text("Nearby")
                }
            }
    }
}
