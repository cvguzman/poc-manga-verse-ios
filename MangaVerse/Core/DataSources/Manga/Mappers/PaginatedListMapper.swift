import UIKit
import Foundation

struct MangaEntityMapper {
    func map(value: MangaEntity, imageData: Data?) -> MangaModel {
        MangaModel(
            id: value.id,
            mainPicture: validateImageData(imageData),
            title: value.title,
            genres: value.genres,
            demographics: value.demographics,
            themes: value.themes,
            authors: value.authors,
            chapters: value.chapters,
            volumes: value.volumes,
            synopsis: value.synopsis,
            startDate: value.startDate,
            endDate: value.endDate,
            status: value.status,
            score: value.score
        )
    }
}

extension MangaEntityMapper {
    private func validateImageData(_ data: Data?) -> UIImage {
        guard let data else {
            return UIImage()
        }
        return UIImage(data: data) ?? UIImage()
    }
}
