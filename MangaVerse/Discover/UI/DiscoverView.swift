import SwiftUI

struct DiscoverView: View {
    @Environment(DiscoverViewModel.self) private var viewModel

    var body: some View {
        NavigationView(content: {
            ScrollView {
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))], content: {
                    ForEach(viewModel.mangas) { manga in
                        NavigationLink {
                            EmptyView()
                        } label: {
                            CardView(model: manga)
                        }
                    }
                })
                .padding(.horizontal)
            }
            .navigationTitle("Discover")
            .task {
                await viewModel.fetchMangas()
            }
        })
    }
}

#Preview {
    DiscoverView()
}
