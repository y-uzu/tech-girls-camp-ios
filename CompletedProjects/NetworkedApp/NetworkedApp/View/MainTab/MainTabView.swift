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
            FavoriteListView()
                .tabItem {
                    Image(systemName: "star")
                    Text("お気に入り")
                }
            PokemonListView()
                .tabItem {
                    Image(systemName: "text.book.closed.fill")
                    Text("ポケモン図鑑")
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
