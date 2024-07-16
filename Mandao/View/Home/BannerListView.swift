import SwiftUI

struct BannerListView: View {
    @EnvironmentObject var bannerViewModel: BannerViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(bannerViewModel.banners) { banner in
                    BannerCard(imageURL: banner.image, name: banner.title, destination: LoginView())
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            bannerViewModel.fetchBanners(areaId: 1) // Asegúrate de usar el areaID correcto
        }
    }
}

struct BannerListView_Previews: PreviewProvider {
    static var previews: some View {
        BannerListView()
            .environmentObject(BannerViewModel())
    }
}
