import SwiftUI

struct StoreListView: View {
    @EnvironmentObject var storeViewModel: StoreViewModel
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            Text("Todos los negocios")
                .padding(.horizontal, 35)
                .font(.title2)
                .fontWeight(.bold)
                .kerning(-0.5)
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView {
                LazyVStack {
                    ForEach(storeViewModel.stores) { store in
                        StoreCard(imageURL: store.banner, name: store.name, destination: ProductDetailsView(storeId: store.id, currency: "$"), rating: store.averageRatings)
                    }
                }
            }
            .padding(10)
        }
    }
}

#Preview{
    StoreListView()
        .environmentObject(StoreViewModel())
        .environmentObject(AppState())
}
