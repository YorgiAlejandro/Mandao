import SwiftUI

struct CategoryListView: View {
    @EnvironmentObject var categoryViewModel: CategoryViewModel
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(categoryViewModel.categories) { category in
                    CategoryCard(imageURL: category.image, name: category.name, destination: EmptyView())
                }
            }
            .padding(.horizontal, 15)
        }
        .frame(height: 100)
    }
}

#Preview{
    CategoryListView()
        .environmentObject(CategoryViewModel())
        .environmentObject(AppState())
}

