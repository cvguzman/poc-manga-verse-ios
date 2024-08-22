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
            if Task.isCancelled {
                return
            }
            await MainActor.run {
                guard !content.isEmpty else {
                    viewState = .emptyContent
                    return
                }
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
            let word = string.lowercased().replacingOccurrences(of: " ", with: "_")
            listType = .matchingWord(word, currentPage)
        case .byCategory(let category, let categoryType):
            switch categoryType {
            case .genre:
                listType = .category(.genre(category), currentPage)
            case .theme:
                listType = .category(.theme(category), currentPage)
            case .demographic:
                listType = .category(.demographic(category), currentPage)
            }
        }
        return listType
    }
}
