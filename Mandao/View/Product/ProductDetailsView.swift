import SwiftUI

struct ProductDetailsView: View {
    @StateObject var viewModel = ProductDetailsViewModel()
    let storeId: Int
    let currency: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 0) {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
                    .padding()
            } else {
                if let store = viewModel.store {
                    Color.yellow
                        .ignoresSafeArea()
                        .frame(height: 8)
                        .padding(0)
                    ZStack(alignment: .topLeading) {
                        GeometryReader { geometry in
                            AsyncImageView(imageURL: store.storeBanner)
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: 280)
                                .clipped()
                                .mask(CurvedShape())
                        }
                        .frame(height: 280)
                        HStack {
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "arrow.left.circle.fill")
                                    .resizable()
                                    .frame(width: 38, height: 38)
                                    .foregroundColor(.white)
                                    .padding(.top, 10)
                                    .padding(.leading, 15)
                                    .fontWeight(.light)
                            }
                            Spacer()
                        }
                    }
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.products) { product in
                                ProductCard(product: product)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchProductDetails(storeId: storeId, currency: currency)
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview{
    NavigationView {
        ProductDetailsView(storeId: 128, currency: "$")
    }
}

