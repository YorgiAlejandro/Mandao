import SwiftUI

struct CategoryCard<Destination: View>: View {
    let imageURL: String
    let name: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            ZStack(alignment: .topLeading) {
                AsyncImageView(imageURL: imageURL)
                    .frame(width: 100, height: 100)
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 6, x: 3, y: 3)
                Text(name)
                    .font(.system(size: 11))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
            }
            .padding(.horizontal, 2)
            .padding(.bottom, 2)
        }
    }
}

#Preview{
    CategoryCard(imageURL: "https://example.com/image.jpg", name: "Cervezas", destination: EmptyView())
}

