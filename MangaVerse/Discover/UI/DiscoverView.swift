import SwiftUI

struct DiscoverView: View {
    @State private var isSheetPresented = false
    @Environment(DiscoverViewModel.self) private var viewModel

    var body: some View {
        NavigationStack {
            if viewModel.state == .loadingFirstPage {
                ProgressView("Loading")
                    .navigationTitle("Discover")
                    .task {
                        await viewModel.fetchItems()
                    }
            } else if viewModel.state == .error {
                Text("Oops something went wrong")
                Button {
                    Task {
                        await viewModel.fetchItems()
                    }
                } label: {
                    Text("Try again")
                }
            } else {
                ScrollView {
                    LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))]) {
                        ForEach(viewModel.paginatedList) { item in
                            Button {
                                viewModel.selectedItem = item
                                isSheetPresented.toggle()
                            } label: {
                                CardView(item: item)
                            }
    //                            .sheet(isPresented: $isSheetPresented) {
    //                                if let item = viewModel.selectedItem {
    //                                    CardDetailView(item: item)
    //                                }
    //                            }
                            .onAppear {
                                viewModel.loadContentIfNeeded(item)
                            }
                        }
                    }
                    .padding(.horizontal)
                    if viewModel.state == .loadingNextPage {
                        Spacer()
                        ProgressView("Loading")
                        Spacer()
                    }
                }
                .navigationTitle("Discover")
            }
        }
    }
}

#Preview {
    DiscoverView()
}
