import SwiftUI

struct BannerListView: View {
    @EnvironmentObject var bannerViewModel: BannerViewModel
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(bannerViewModel.banners) { banner in
                    BannerCard(imageURL: banner.image, name: banner.title, destination: EmptyView())
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview{
    BannerListView()
        .environmentObject(BannerViewModel())
        .environmentObject(AppState())
}

