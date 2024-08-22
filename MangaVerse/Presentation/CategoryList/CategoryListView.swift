import SwiftUI

struct CategoryListView: View {
    private let environment: MangaVerseEnvironment
    private let categoryViewModel: CategoryListViewModel

    init(environment: MangaVerseEnvironment) {
        self.environment = environment
        categoryViewModel = environment.categoryListViewModel
    }

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
                            Label {
                                Text(row.title)
                            } icon: {
                                Image(systemName: "book.circle")
                            }
                        }
                    }
                    .navigationDestination(for: CategoryModel.self, destination: { category in
                        PaginatedListView(viewModel: environment.paginatedListViewModel, loaderType: .byCategory(category.title.lowercased(), category.categoryType))
                            .navigationTitle("\(category.categoryType.rawValue.capitalized)/\(category.title)")
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
