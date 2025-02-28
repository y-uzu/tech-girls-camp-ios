//: [目次](0_Table_of_Contents) / [前のページ](@previous)
/*:
# オプショナル型

Swiftには、値が「あるかもしれないし、ないかもしれない」という状態を表現するための**オプショナル型**が用意されています。
オプショナル型を使うことで、値が存在しない場合（`nil`）も安全に扱うことができます。

- オプショナル型の変数や定数には、値が「ある場合」と「ない場合（`nil`）」を区別して保持することができます。
- オプショナル型は、型名の後に`?`を付けて表します。

それでは、オプショナル型の基本を見ていきましょう。
*/
import Foundation

// オプショナル型の例
var optionalName: String? = "Alice"
optionalName = nil // 値がない状態（nilを代入）

// 通常の型とオプショナル型の違い
var nonOptionalName: String = "Bob"
// nonOptionalName = nil // これはエラーになります💥（通常の型はnilを扱えません）

/*:
## アンラップ
*/
// オプショナル型を通常の型として扱いたい場合、以下の方法で値を取り出すことができます
var optionalBird: String? = "Swallow"
if let bird = optionalBird {
    print(bird) // Swallow
} else {
    print("optionalBird は nil です")
}

// !でも取り出すことができます
var optionalAnimal: String? = "Tiger"
let unwrappedAnimal = optionalAnimal! // optionalAnimal が nil だった場合クラッシュします💥
print(unwrappedAnimal) // Tiger

//: [次のページ](@next)
