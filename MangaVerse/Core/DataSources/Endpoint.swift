enum Endpoint {
    enum Manga: String {
        // MARK: - General
        case paginatedList = "/list/mangas?page=%@&per=20"
        case genres = "/list/genres"
        case demographics = "/list/demographics"
        case themes = "/list/themes"

        // MARK: - Search
        case searchByWord = "/search/mangasContains/%@"
        case searchByGenre = "/list/mangaByGenre/%@"
        case searchByDemographic = "/list/mangaByDemographic/%@"
        case searchByTheme = "/list/mangaByTheme/%@"
        case searchByAuthor = "/list/mangaByAuthor/%@?page=1&per=20"
    }
}
