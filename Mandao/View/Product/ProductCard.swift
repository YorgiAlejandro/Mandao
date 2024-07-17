import SwiftUI

struct CurvedShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - 60))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY - 60), control: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

struct ProductCard: View {
    let product: ProductDetail
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.callout)
                    .kerning(1)
                    .padding(.bottom, 1)
                Text(String(format: "$%.2f", product.amount))
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .padding(.top, 1)
            }
            Spacer()
            if let url = URL(string: product.image), UIApplication.shared.canOpenURL(url) {
                AsyncImageView(imageURL: product.image)
                    .frame(width: 90, height: 90)
                    .cornerRadius(100)
                    .padding(.trailing, 10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(30)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.gray.opacity(0.7), lineWidth: 0.5)
        )
        .padding(.vertical, 5)
    }
}
