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
                        StoreCard(imageURL: store.banner, name: store.name, destination: LoginView(), rating: store.averageRatings)
                    }
                }
            }
            .padding(10)
        }
    }
}

struct StoreListView_Previews: PreviewProvider {
    static var previews: some View {
        StoreListView()
            .environmentObject(StoreViewModel())
            .environmentObject(AppState())
    }
}
