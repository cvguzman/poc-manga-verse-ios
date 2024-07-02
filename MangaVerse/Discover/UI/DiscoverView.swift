import SwiftUI

struct DiscoverView: View {
    @State var viewModel: DiscoverViewModel
    
    init(viewModel: DiscoverViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach(viewModel.mangas) { manga in
                if let title = manga.title {
                    Text(title)
                }
            }
        }
        .task {
            await viewModel.onAppear()
        }
    }
}

#Preview {
    ViewFactory.view(type: .discover)
}
