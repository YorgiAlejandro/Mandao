import SwiftUI

struct HomeView: View {
    @StateObject private var appState = AppState()
    @StateObject private var cityViewModel = CityViewModel()
    @StateObject private var bannerViewModel = BannerViewModel()
    @StateObject private var categoryViewModel = CategoryViewModel()
    @StateObject private var storeViewModel = StoreViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Color.yellow
                    .ignoresSafeArea()
                    .frame(height: 10)
                    .padding(0)
                TopBarView()
                    .padding(.bottom, 30)
                    .environmentObject(appState)
                    .environmentObject(cityViewModel)
                BannerListView()
                    .environmentObject(bannerViewModel)
                CategoryListView()
                    .environmentObject(categoryViewModel)
                StoreListView()
                    .environmentObject(storeViewModel)
            }
        }
        .onAppear {
            print("HomeView onAppear called")
            cityViewModel.fetchCities()
            bannerViewModel.observeProvinceChanges(appState: appState)
            categoryViewModel.observeProvinceChanges(appState: appState)
            storeViewModel.observeProvinceChanges(appState: appState)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
