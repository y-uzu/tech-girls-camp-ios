//: [目次](0_Table_of_Contents) / [前のページ](@previous)
/*:
# コレクション
*/
import Foundation

/*:
## セット (Set)
- 値の重複のないコレクションです。
- 順序は保証されません。
 */

var animals = Set<String>()
animals.insert("dog")
animals.insert("cat")
print(animals) // ["cat", "dog"]

animals.insert("dog")
//print(animals) // ["cat", "dog"] // "dog" は重複しません👬
//: [次のページ](@next)

