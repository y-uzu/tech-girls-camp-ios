//
//  MainTabView.swift
//  CoffeeApp
//
//  CompletedProjects
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            CoffeeListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("コーヒー")
                }
            Text("お気に入り")
                .tabItem {
                    Image(systemName: "star")
                    Text("お気に入り")
                }
            Text("tab3")
                .tabItem {
                    Image(systemName: "doc.text")
                    Text("tab3")
                }
            Text("tab4")
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("tab4")
                }
        }
    }
}

#Preview {
    MainTabView()
}
