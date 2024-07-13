enum Endpoint {
    enum Manga: String {
        case paginatedList = "/list/mangas?page=%@&per=20"
        case genres = "/list/genres"
        case demographics = "/list/demographics"
        case themes = "/list/themes"
    }
}
