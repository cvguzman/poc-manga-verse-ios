import Foundation

@Observable
final class PaginatedListViewModel {
    // MARK: - Properties

    private let dataSource: MangaDataSource
    private var currentPage: Int = 1

    var content = [MangaModel]()
    var selectedItem: MangaModel?
    var viewState: PaginatedListViewState = .loadingContent
    var canLoadMoreContent = false

    // MARK: - Initializer & Public Methods

    init(dataSource: MangaDataSource) {
        self.dataSource = dataSource
    }

    func layout(by loaderType: PaginatedListLoaderType, reference: MangaModel) {
        guard
            viewState == .contentLoaded,
            reference.id == content.last?.id
        else {
            canLoadMoreContent = false
            return
        }
        canLoadMoreContent = true
        Task {
            await loadContent(by: loaderType)
        }
    }

    func loadContent(by loaderType: PaginatedListLoaderType) async {
        do {
            let fetchType: MangaListType = setFetchType(by: loaderType)
            let content: [MangaModel] = try await dataSource.fetchMangas(from: fetchType)
            // Check cancellation
            await MainActor.run {
                self.currentPage += 1
                self.content.append(contentsOf: content)
                viewState = .contentLoaded
            }
        } catch {
            await MainActor.run {
                viewState = .error
            }
        }
    }

    // MARK: - Private Methods

    private func setFetchType(by loaderType: PaginatedListLoaderType) -> MangaListType {
        let listType: MangaListType
        switch loaderType {
        case .byPage:
            listType = .page(currentPage)
        case .byMatchingWord(let string):
            listType = .matchingWord(string)
        case .byCategory(let category, let categoryType):
            switch categoryType {
            case .genre:
                listType = .category(.genre(category))
            case .theme:
                listType = .category(.theme(category))
            case .demographic:
                listType = .category(.demographic(category))
            }
        }
        return listType
    }
}