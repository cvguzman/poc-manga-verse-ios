import UIKit

struct MangaModel: Identifiable, Equatable {
    let id: Int
    let mainPicture: UIImage
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
    let score: String

    static func == (lhs: MangaModel, rhs: MangaModel) -> Bool {
        return lhs.id == rhs.id
    }
}
