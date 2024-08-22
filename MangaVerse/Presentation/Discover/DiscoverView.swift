import SwiftUI

struct DiscoverView: View {
    let environment: MangaVerseEnvironment

    var body: some View {
        NavigationStack {
            PaginatedListView(viewModel: environment.paginatedListViewModel, loaderType: .byPage)
                .navigationTitle("Discover")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                           EmptyView()
                                .navigationTitle("Search")
                        } label: {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .tint(.primary)
                        }
                    }
                }
        }
    }
}
