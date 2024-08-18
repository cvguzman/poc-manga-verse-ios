import SwiftUI

struct DiscoverView: View {
    @Environment(PaginatedListViewModel.self) private var paginatedListViewModel

    var body: some View {
        NavigationStack {
            PaginatedListView(loaderType: .byPage)
                .environment(paginatedListViewModel)
                .navigationTitle("Discover")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            PaginatedListView(loaderType: .byPage)
                                .environment(paginatedListViewModel)
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
