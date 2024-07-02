struct MangaModel: Decodable, Identifiable {
    let id: Int
    let mainPicture: String?
    let title: String?
    let titleJapanese: String?
    let volumes: Int?
    let chapters: Int?
    let score: Double
    let status: String?
    let startDate: String?
    let endDate: String?
    let sypnosis: String?
    let background: String?
    let demographics: [MangaDemographicModel]?
    let genres: [MangaGenreModel]?
    let themes: [MangaThemeModel]?
    let authors: [MangaAuthorModel]?
}
