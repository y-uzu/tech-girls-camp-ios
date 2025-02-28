//: [目次](0_Table_of_Contents) / [前のページ](@previous)
/*:
# 構造体とクラス

Swiftには、データをまとめるための**構造体 (struct)** と **クラス (class)** があります。どちらもプロパティやメソッドを持つことができます。
構造体とクラスにはいくつかの違いがありますが、今の段階では、どちらもデータをまとめて扱うための機能だと理解してもらえれば充分です。
*/
import Foundation

// 構造体の定義
struct PersonStruct {
    var name: String
    var age: Int

    func greet() {
        print("こんにちは！私は\(name)で、\(age)歳です。")
    }
}

// クラスの定義
class PersonClass {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func greet() {
        print("こんにちは！私は\(name)で、\(age)歳です。")
    }
}

// 構造体のインスタンスを作成
var structPerson = PersonStruct(name: "太郎", age: 25)
structPerson.greet()

// クラスのインスタンスを作成
let classPerson = PersonClass(name: "花子", age: 30)
classPerson.greet()


//: [次のページ](@next)
