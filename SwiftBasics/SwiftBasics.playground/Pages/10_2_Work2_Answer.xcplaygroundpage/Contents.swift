//: [目次](0_Table_of_Contents) / [前のページ](@previous)
/*:
# 解答例

*/

import Foundation

/*:
### 問1.
- 以下の struct を編集して、コンソールにあなたの自己紹介を出力してみてください。
*/

struct Person {
    var name: String
    var hometown: String
    var hobbies: [String]

    func introduce() {
        print("私の名前は\(name)です。\n出身地は\(hometown)です。\n趣味は\(hobbies.joined(separator: ","))です。")
    }
}

let me = Person(name: "えのもと", hometown: "東京", hobbies: ["サッカー", "読書", "ドライブ"])
me.introduce()

/*:
### 問2.
- 1から30までの数を引数として受け取り、文字列として返す関数を作成してみましょう。ただし、以下の条件を満たすようにしてください：
  - 3の倍数のときは数字の代わりに 'Fizz' と表示してください。
  - 5の倍数のときは数字の代わりに 'Buzz' と表示してください。
  - 3と5両方の倍数のときは 'FizzBuzz' と表示してください。
*/

func fizzBuzz(number: Int) -> String {
    if number % 15 == 0 {
        return "FizzBuzz"
    } else if number % 3 == 0 {
        return "Fizz"
    } else if number % 5 == 0 {
        return "Buzz"
    } else {
        return String(number)
    }
}

// 1 から 30 までを引数として fizzBuzz 関数を実行します。
for i in 1...30 {
    print(fizzBuzz(number: i))
}

//: [次のページ](@next)
