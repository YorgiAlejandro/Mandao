import SwiftUI

struct ContentView: View {
    @StateObject private var appState = AppState()
    @StateObject private var cityViewModel = CityViewModel()
    @StateObject private var bannerViewModel = BannerViewModel()
    @StateObject private var categoryViewModel = CategoryViewModel()

    var body: some View {
        Group {
            if appState.isLoggedIn {
                HomeView()
                    .environmentObject(appState)
                    .environmentObject(bannerViewModel)
                    .environmentObject(categoryViewModel)
                    .environmentObject(cityViewModel)
            } else {
                LoginView()
                    .environmentObject(appState)
                    .environmentObject(cityViewModel)
            }
        }
        .onAppear {
            cityViewModel.fetchCities()
            bannerViewModel.observeProvinceChanges(appState: appState)
            categoryViewModel.observeProvinceChanges(appState: appState)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
