//
//  CalculatorView.swift
//  CalculatorApp
//
//  ChallengeProjects
//

import SwiftUI

struct CalculatorView: View {
    // 最初に利用する変数を定義しています
    // @State: プロパティが変更されたときにビューを自動的に再描画するためのおまじない
    @State var firstNumber: String = ""
    @State var secondNumber: String = ""
    @State var result: String = "?"
    @State var firstNumber2: String = ""
    @State var secondNumber2: String = ""
    @State var result2: String = "?"
    
    var body: some View {
        Rectangle()
        VStack(spacing: 20) {
            Text("足し算電卓")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack(spacing: 10) {
                // 1つ目の入力フィールド
                // @Stateのついたプロパティには$をつけるというおまじない。
                TextField("?", text: $firstNumber)
                    .keyboardType(.numberPad)
                    .frame(width: 60)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("+")
                    .font(.title)
                
                // 2つ目の入力フィールド
                TextField("?", text: $secondNumber)
                    .keyboardType(.numberPad)
                    .frame(width: 60)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("=")
                    .font(.title)
                
                // 結果の表示
                Text(result)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 100)
                    .multilineTextAlignment(.center)
            }
            
            // 計算ボタン
            Button(action: {
                // ここでボタンを押した時の挙動を記述
                // 今回は calculateSum() というメソッド(関数)を呼び出しています
                // 具体的な処理は calculateSum() 内に記述します
                calculateSum()
            }) {
                Text("計算する")
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.cyan)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

        }
        .padding()
        
        Divider()
        
        // TODO: - Challenge2
        //

        Text("引き算電卓")
            .font(.largeTitle)
            .fontWeight(.bold)
        
        HStack(spacing: 10) {
            // 1つ目の入力フィールド
            // @Stateのついたプロパティには$をつけるというおまじない。
            TextField("?", text: $firstNumber2)
                .keyboardType(.numberPad)
                .frame(width: 60)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("-")
                .font(.title)
            
            // 2つ目の入力フィールド
            TextField("?", text: $secondNumber2)
                .keyboardType(.numberPad)
                .frame(width: 60)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("=")
                .font(.title)
            
            // 結果の表示
            Text(result2)
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 100)
                .multilineTextAlignment(.center)
        }
        
        // 計算ボタン
        Button(action: {
            // ここでボタンを押した時の挙動を記述
            // 今回は calculateSum() というメソッド(関数)を呼び出しています
            // 具体的な処理は calculateSum() 内に記述します
            calculateSum2()
        }) {
            Text("計算する")
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.mint)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding(.horizontal)
        
        Spacer()
        
    }
    
    // 足し算の処理
    func calculateSum() {
        // TODO: - Challenge1
        let firstNumberInt = Int(firstNumber)
        let secondNumberInt = Int(secondNumber)
        if let firstNumberInt = Int(firstNumber), let secondNumberInt = Int(secondNumber) {
            // 値が存在する時はこっち (= Intにキャストできた時)
            let resultInt = firstNumberInt + secondNumberInt
            result = String(resultInt)
        } else {
            // 値が存在しない時はこっち (= Intにキャストできなかった時)
            result = "Error"
        }
         //ここに計算ロジックを記述し、計算結果を表示できるようにしてみよう

    }
    func calculateSum2() {
        // TODO: - Challenge1
        let firstNumberInt2 = Int(firstNumber2)
        let secondNumberInt2 = Int(secondNumber2)
        if let firstNumberInt2 = Int(firstNumber2), let secondNumberInt2 = Int(secondNumber2) {
            // 値が存在する時はこっち (= Intにキャストできた時)
            let resultInt2 = firstNumberInt2 - secondNumberInt2
            result2 = String(resultInt2)
        } else {
            // 値が存在しない時はこっち (= Intにキャストできなかった時)
            result2 = "Error"
        }
         //ここに計算ロジックを記述し、計算結果を表示できるようにしてみよう

    }
}

#Preview {
    CalculatorView()
}
