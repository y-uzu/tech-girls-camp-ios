//: [目次](0_Table_of_Contents) / [前のページ](@previous)
/*:
# 練習問題
- ここまでの内容を活用して、練習問題に取り組んでみましょう！
- 以下のコードを編集して、指定される出力がコンソールに表示されるようにしてください。
- 前のページを見返してもよいですし、分からなければインターネットを検索してもかまいません🙆

*/

import Foundation

/*:
### 問1.
- 以下の struct を編集して、コンソールにあなたの自己紹介を出力してみてください。
*/

struct Person {
    var name: String

// 好きな項目を追加してみましょう
//    var hobbies: [String]
//    var hometown: String

    func introduce() {
        // 名前以外の項目も出力してみましょう
        print("私の名前は\(name)です。")
    }
}

let me = Person(name: "your name")
me.introduce() // 私の名前は...

/*:
### 問2.
- 1から30までの数を引数として受け取り、文字列として返す関数を作成してみましょう。ただし、以下の条件を満たすようにしてください：
  - 3の倍数のときは数字の代わりに 'Fizz' と表示してください。
  - 5の倍数のときは数字の代わりに 'Buzz' と表示してください。
  - 3と5両方の倍数のときは 'FizzBuzz' と表示してください。
*/

func fizzBuzz(number: Int) -> String {
    /*
     ここにプログラムを実装してみましょう！
    */
    return String(number) // ヒント： Int 型を String() で囲むことで、 String 型に変換できます
}

// 1 から 30 までを引数として fizzBuzz 関数を実行します。
for i in 1...30 {
    print(fizzBuzz(number: i))
}

//: [次のページ](@next)
