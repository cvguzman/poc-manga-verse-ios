enum PaginatedListLoaderType {
    case byPage
    case byMatchingWord(String)
    case byCategory(String, PaginatedListItemCategoryType)
}
