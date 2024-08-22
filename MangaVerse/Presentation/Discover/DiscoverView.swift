import SwiftUI

struct DiscoverView: View {
    let environment: MangaVerseEnvironment
    @State private var searchText = String()
    @State private var readyForSearch = false

    var body: some View {
        NavigationStack {
            Group {
                if !readyForSearch {
                    PaginatedListView(viewModel: environment.paginatedListViewModel, loaderType: .byPage)
                } else {
                    PaginatedListView(viewModel: environment.paginatedListViewModel, loaderType: .byMatchingWord(searchText))
                }
            }
            .navigationTitle("Discover")
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search by name or any word")
            .onChange(of: searchText, {
                readyForSearch = false
            })
            .onSubmit(of: .search) {
                readyForSearch = true
            }
        }
    }
}
