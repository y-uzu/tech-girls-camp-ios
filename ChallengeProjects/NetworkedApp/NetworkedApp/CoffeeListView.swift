import SwiftUI

struct CoffeeListView: View {
   
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                CoffeeItemView()
                    .padding(.horizontal)
                CoffeeItemView()
                    .padding(.horizontal)
                CoffeeItemView()
                    .padding(.horizontal)
                CoffeeItemView()
                    .padding(.horizontal)
                CoffeeItemView()
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    CoffeeListView()
}
