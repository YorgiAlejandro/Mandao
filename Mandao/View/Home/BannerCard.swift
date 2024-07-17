import SwiftUI

struct BannerCard<Destination: View>: View {
    let imageURL: String
    let name: String
    let destination: Destination
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImageView(imageURL: imageURL)
                .frame(width: 280, height: 170)
                .cornerRadius(30)
                .shadow(color: .gray, radius: 6, x: 3, y: 3)
            HStack {
                Text(name)
                    .font(.title3)
                    .fontWeight(.bold)
                NavigationLink(destination: destination) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 20, height: 20)
                        .overlay(
                            Image(systemName: "chevron.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 9, height: 9)
                                .foregroundColor(.black)
                        )
                        .shadow(color: .gray, radius: 1)
                }
                Spacer()
            }
            .padding(.horizontal, 25)
        }
        .padding(.horizontal, 5)
        .padding(.bottom, 5)
    }
}

#Preview{
    BannerCard(imageURL: "https://example.com/image.jpg", name: "Restaurante Ejemplo", destination: EmptyView())
}

