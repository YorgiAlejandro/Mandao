import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var bannerViewModel: BannerViewModel
    @EnvironmentObject var categoryViewModel: CategoryViewModel
    @EnvironmentObject var storeViewModel: StoreViewModel
    @State private var currentProvinceId: Int?

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Color.yellow
                    .ignoresSafeArea()
                    .frame(height: 10)
                    .padding(0)
                TopBarView()
                    .padding(.bottom, 30)
                BannerListView()
                CategoryListView()
                StoreListView()
            }
            .onAppear {
                if currentProvinceId == nil || currentProvinceId != appState.selectedProvince.id {
                    currentProvinceId = appState.selectedProvince.id
                    fetchInitialData()
                }
            }
        }
    }

    private func fetchInitialData() {
        print("Fetching initial data for areaId: \(appState.selectedProvince.id)")
        bannerViewModel.fetchBanners(areaId: appState.selectedProvince.id)
        categoryViewModel.fetchCategories(areaId: appState.selectedProvince.id)
        storeViewModel.fetchStores(areaId: appState.selectedProvince.id)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AppState())
            .environmentObject(BannerViewModel())
            .environmentObject(CategoryViewModel())
            .environmentObject(StoreViewModel())
    }
}
