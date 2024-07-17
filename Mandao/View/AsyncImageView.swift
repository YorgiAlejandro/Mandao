import SwiftUI

struct AsyncImageView: View {
    let imageURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .empty:
                ZStack {
                    Color.gray.opacity(0.1)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                EmptyView()
            @unknown default:
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
