import SwiftUI

struct HomeView: View {
    @State var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach(viewModel.mangas) { manga in
                Text(manga.title)
            }
        }
        .task {
            await viewModel.onAppear()
        }
    }
    
}

#Preview {
    ViewFactory.view(type: .home)
}
