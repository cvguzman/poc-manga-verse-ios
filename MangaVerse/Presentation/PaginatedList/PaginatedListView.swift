import SwiftUI

struct PaginatedListView: View {
    let viewModel: PaginatedListViewModel
    @State private var isSheetPresented = false
    let loaderType: PaginatedListLoaderType

    var body: some View {
        switch viewModel.viewState {
        case .contentLoaded:
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
                    ForEach(viewModel.content) { item in
                        Button {
                            viewModel.selectedItem = item
                            isSheetPresented.toggle()
                        } label: {
                            CardView(item: item)
                        }
                        .onAppear {
                            viewModel.layout(by: loaderType, reference: item)
                        }
                        .sheet(isPresented: $isSheetPresented) {
                            if let item = viewModel.selectedItem {
                                CardDetailView(item: item)
                            }
                        }
                    }
                }
                .padding(.horizontal)

                if viewModel.canLoadMoreContent {
                    Spacer()
                    ProgressView("Loading")
                    Spacer()
                }
            }
        case .loadingContent:
            ProgressView("Loading")
                .task {
                    await viewModel.loadContent(by: loaderType)
                }
        case .error:
            ErrorView {
                Task {
                    viewModel.viewState = .loadingContent
                    await viewModel.loadContent(by: loaderType)
                }
            }
        }
    }
}
