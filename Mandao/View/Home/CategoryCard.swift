import SwiftUI

struct CategoryCard<Destination: View>: View {
    let imageURL: String
    let name: String
    let destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: imageURL)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                    } else if phase.error != nil {
                        Color.red // Error view
                    } else {
                        Color.gray // Placeholder view
                    }
                }
                .frame(width: 100, height: 100)
                .cornerRadius(15)
                .shadow(color: .gray, radius: 6, x: 3, y: 3)
                Text(name)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 5)
            }
            .padding(.horizontal, 5)
        }
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(imageURL: "https://example.com/image.jpg", name: "Cervezas", destination: LoginView())
    }
}
