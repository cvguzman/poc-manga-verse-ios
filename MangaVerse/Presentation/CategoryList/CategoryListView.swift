import SwiftUI

struct CategoryListView: View {
    @Environment(CategoryListViewModel.self) private var categoryViewModel
    @Environment(PaginatedListViewModel.self) private var paginatedListViewModel

    var body: some View {
        NavigationStack {
            Group {
                switch categoryViewModel.viewState {
                case .loadingCategories:
                    ProgressView("Loading")
                        .task {
                            await categoryViewModel.loadCategories()
                        }
                case .contentLoaded:
                    List(categoryViewModel.categories, children: \.children) { row in
                        if row.children == nil {
                            NavigationLink(row.title, value: row)
                        } else {
                            Text(row.title)
                        }
                    }
                    .navigationDestination(for: CategoryModel.self, destination: { category in
                        PaginatedListView(loaderType: .byCategory(category.title.lowercased(), category.categoryType))
                            .navigationTitle("\(category.categoryType.rawValue.capitalized)/\(category.title)")
                            .environment(paginatedListViewModel)
                    })
                    .listStyle(SidebarListStyle())
                case .error:
                    ErrorView {
                        Task {
                            await categoryViewModel.loadCategories()
                        }
                    }
                }
            }
            .navigationTitle("Categories")
        }
    }
}
