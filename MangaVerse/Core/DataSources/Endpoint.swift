enum Endpoint {
    enum Manga: String {
        // MARK: - General
        case paginatedList = "/list/mangas?page=%@&per=20"
        case genres = "/list/genres"
        case demographics = "/list/demographics"
        case themes = "/list/themes"

        // MARK: - Search
        case searchByWord = "/search/mangasContains/%@?page=%@&per=20"
        case searchByGenre = "/list/mangaByGenre/%@?page=%@&per=20"
        case searchByDemographic = "/list/mangaByDemographic/%@?page=%@&per=20"
        case searchByTheme = "/list/mangaByTheme/%@?page=%@&per=20"
        case searchByAuthor = "/list/mangaByAuthor/%@?page=1&per=20"
    }
}
