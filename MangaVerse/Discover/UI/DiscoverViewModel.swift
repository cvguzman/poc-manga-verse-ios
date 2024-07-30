import Observation
import Foundation

@Observable
final class DiscoverViewModel {
    private let dataSource: MangaRemoteDataSource
    private var canLoadMorePages = true
    private var page: Int = 1

    var paginatedList = [MangaModel]()
    var selectedItem: MangaModel?
    var state: DiscoverViewState = .loadingFirstPage

    private var currentTask: Task<Void, Never>? {
        willSet {
            if let task = currentTask {
                if task.isCancelled { return }
                task.cancel()
            }
        }
    }

    init(dataSource: MangaRemoteDataSource) {
        self.dataSource = dataSource
    }

    func loadContentIfNeeded(_ reference: MangaModel) {
        guard
            canLoadMorePages,
            case .loaded = state,
            reference.id == paginatedList.last?.id
        else { return }
        state = .loadingNextPage
        currentTask = Task {
            await fetchItems()
        }
    }

    func fetchItems() async {
        do {
            let paginatedList = try await dataSource.fetchMangas(from: .page(page))
            guard !Task.isCancelled else {
                return
            }
            guard !paginatedList.isEmpty else {
                canLoadMorePages = false
                return
            }
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.page += 1
                self.paginatedList.append(contentsOf: paginatedList)
                self.state = .loaded
            }
        } catch {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.state = .error
            }
        }
    }
}

enum DiscoverViewState {
    case loadingFirstPage
    case loadingNextPage
    case loaded
    case error
}
