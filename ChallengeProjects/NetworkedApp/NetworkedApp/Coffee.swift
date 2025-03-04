import Foundation

struct Coffee: Decodable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var ingredients: [String]
    var image: URL
}
