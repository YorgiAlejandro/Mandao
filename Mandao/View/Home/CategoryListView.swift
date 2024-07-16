import SwiftUI

struct CategoryListView: View {
    @EnvironmentObject var categoryViewModel: CategoryViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(categoryViewModel.categories) { category in
                    CategoryCard(imageURL: category.image, name: category.name, destination: LoginView())
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            categoryViewModel.fetchCategories(areaId: 1) // Asegúrate de usar el areaID correcto
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
            .environmentObject(CategoryViewModel())
    }
}
