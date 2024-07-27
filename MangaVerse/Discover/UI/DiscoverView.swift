import SwiftUI

struct DiscoverView: View {
    @Environment(DiscoverViewModel.self) private var viewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))], content: {
                    ForEach(viewModel.mangas) { manga in
                        NavigationLink(value: manga) {
                            CardView(model: manga)
                        }
                    }
                })
                .padding(.horizontal)
            }
            .navigationDestination(for: MangaEntity.self, destination: { manga in
                MangaDetailView(manga: manga)
            })
            .navigationTitle("Discover")
            .task {
                await viewModel.fetchMangas()
            }
        }
    }
}

#Preview {
    DiscoverView()
}
