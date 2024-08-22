struct MangaEntity: Decodable {
    let id: Int
    let mainPicture: String
    let title: String
    let genres: [MangaGenreEntity]
    let demographics: [MangaDemographicEntity]
    let themes: [MangaThemeEntity]
    let authors: [MangaAuthorEntity]
    let chapters: Int?
    let volumes: Int?
    let synopsis: String?
    let startDate: String?
    let endDate: String?
    let status: String
    let score: Double

    private enum CodingKeys: String, CodingKey {
        case id, mainPicture, title, genres, demographics, themes, authors, chapters, volumes,
            startDate, endDate, status, score
        case synopsis = "sypnosis"
    }
}
