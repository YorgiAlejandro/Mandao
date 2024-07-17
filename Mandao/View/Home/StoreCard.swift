import SwiftUI

struct StoreCard<Destination: View>: View {
    let imageURL: String
    let name: String
    let destination: Destination
    let rating: Double
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack(alignment: .leading, spacing: 0) {
                AsyncImageView(imageURL: imageURL)
                    .frame(height: 100)
                    .clipped()
                HStack {
                    Text(name)
                        .foregroundColor(.black)
                        .kerning(-0.5)
                        .fontWeight(.bold)
                        .font(.callout)
                        .padding(.leading, 8)
                        .padding(.top, 8)
                    Spacer()
                    HStack(spacing: 2) {
                        Text(String(format: "%.1f", rating))
                            .foregroundColor(.black)
                            .kerning(-0.5)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 12))
                    }
                    .padding(.trailing, 8)
                    .padding(.top, 8)
                }
                .background(Color.white)
                .frame(height: 45)
                .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                .padding(.horizontal, 5)
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .black, radius: 0.5, x: 0, y: 0)
            .padding(.horizontal, 10)
            .padding(.bottom, 5)
        }
    }
}

// Helper to round specific corners
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

#Preview{
    StoreCard(imageURL: "https://example.com/image.jpg", name: "Restaurante Ejemplo", destination: EmptyView(), rating: 3.5)
}

