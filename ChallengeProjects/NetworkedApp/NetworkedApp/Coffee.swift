import SwiftUI

struct Coffee: Identifiable, Decodable {
    let id: Int
    let title: String
    let description: String
    let ingredients: [String]
    let image: URL
}
