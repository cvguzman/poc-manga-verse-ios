import Observation

@Observable
final class DiscoverViewModel {
    private let dataSource: MangaRemoteDataSource
    private var page: Int = .zero

    var mangas = [MangaEntity]()

    init(dataSource: MangaRemoteDataSource) {
        self.dataSource = dataSource
    }

    func fetchMangas() async {
        do {
            let paginatedList = try await dataSource.fetchMangas(from: .page(page))
            mangas = paginatedList.items
        } catch {
            fatalError()
        }
    }
}
