import SwiftUI

struct BannerListView: View {
    @EnvironmentObject var bannerViewModel: BannerViewModel
    @EnvironmentObject var appState: AppState

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(bannerViewModel.banners) { banner in
                    BannerCard(imageURL: banner.image, name: banner.title, destination: LoginView())
                }
            }
            .padding(.horizontal)
        }
    }
}

struct BannerListView_Previews: PreviewProvider {
    static var previews: some View {
        BannerListView()
            .environmentObject(BannerViewModel())
            .environmentObject(AppState())
    }
}
