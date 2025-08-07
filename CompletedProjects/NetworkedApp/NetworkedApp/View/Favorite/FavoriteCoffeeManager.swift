//
//  FavoriteCoffeeManager.swift
//  NetworkedApp
//
//  Created by marcy731 on 2025/03/08.
//
// 簡易的なIn-Memoryデータベースを作成
// In-Memoryなのでアプリを再起動するとデータが消えてしまいます
// アプリを再起動してもデータを保持したい場合はSwiftDataやFirebaseなどのデータベースを検討してください

import SwiftUI

@MainActor
@Observable
final class FavoriteCoffeeManager {
    static let shared = FavoriteCoffeeManager()
    private(set) var coffees: [Coffee] = []

    private init() {}

    func toggle(_ coffee: Coffee) {
        if contains(coffee) {
            remove(coffee)
        } else {
            add(coffee)
        }
    }

    func contains(_ coffee: Coffee) -> Bool {
        coffees.contains { $0.id == coffee.id }
    }

    private func add(_ coffee: Coffee) {
        coffees.append(coffee)
    }

    private func remove(_ coffee: Coffee) {
        coffees.removeAll { $0.id == coffee.id }
    }
}
