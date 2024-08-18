import Foundation

enum SearchViewState {
    case loadingCategories
    case contentLoaded
    case error
}

@Observable
final class CategoryListViewModel {
    private let dataSource: MangaDataSource

    var categories = CategoryModel.base
    var viewState: SearchViewState = .loadingCategories

    init(dataSource: MangaDataSource) {
        self.dataSource = dataSource
    }

    @MainActor
    func loadCategories() async {
        do {
            async let genres = try await dataSource.fetchCategories(by: .genre(""))
            async let themes = try await dataSource.fetchCategories(by: .theme(""))
            async let demographics = try await dataSource.fetchCategories(by: .demographic(""))
            let categories = try await [genres, themes, demographics]

            for (index, categoriesType) in categories.enumerated() {
                let categoryChildren = categoriesType.map { categoryType in
                    CategoryModel(title: categoryType, categoryType: setCategoryType(by: index))
                }
                self.categories[index].children = categoryChildren
            }

            self.viewState = .contentLoaded
        } catch {
            print(error)
        }
    }

    private func setCategoryType(by index: Int) -> PaginatedListItemCategoryType {
        switch index {
        case 0:
            return .genre
        case 1:
            return .theme
        default:
            return .demographic
        }
    }
}
