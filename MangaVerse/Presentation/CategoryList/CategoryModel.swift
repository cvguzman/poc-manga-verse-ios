import Foundation

struct CategoryModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    var categoryType: PaginatedListItemCategoryType
    var children: [CategoryModel]?

    static let base = [
        CategoryModel(
            title: "Genres",
            categoryType: .genre,
            children: nil
        ),
        CategoryModel(
            title: "Themes",
            categoryType: .theme,
            children: nil
        ),
        CategoryModel(
            title: "Demographics",
            categoryType: .demographic,
            children: nil
        )
    ]
}
