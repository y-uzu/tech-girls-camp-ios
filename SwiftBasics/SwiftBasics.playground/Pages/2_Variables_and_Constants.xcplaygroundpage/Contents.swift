//: [目次](0_Table_of_Contents) / [前のページ](@previous)
/*:
# 変数と定数

Swiftでは、値を保存するために**変数**と**定数**を使用します。
- **変数**は `var` キーワードで宣言し、後から値を変更できます。
- **定数**は `let` キーワードで宣言し、一度設定した値を変更することはできません。
*/
import Foundation

// 変数は var を使って宣言します
var message = "こんにちは"
message = "こんにちは、Swiftの世界へようこそ！" // 値の変更が可能です
print(message) // "こんにちは、Swiftの世界へようこそ！"

// 定数は let を使って宣言します
let greeting = "Hello"
// greeting = "Hello, world!" // 定数の値は変更することができません。これはエラーになります💥
// print(greeting) // "Hello"

//: [次のページ](@next)
