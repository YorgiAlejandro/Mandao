import SwiftUI

struct CategoryListView: View {
    @EnvironmentObject var categoryViewModel: CategoryViewModel
    @EnvironmentObject var appState: AppState

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(categoryViewModel.categories) { category in
                    CategoryCard(imageURL: category.image, name: category.name, destination: LoginView())
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
            .environmentObject(CategoryViewModel())
            .environmentObject(AppState())
    }
}
