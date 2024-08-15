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
            startDate: formatDate(value.startDate),
            endDate: formatDate(value.endDate),
            status: formatStatus(value.status),
            score: String(format: "%.2f", value.score)
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

    private func formatDate(_ dateString: String?) -> String? {
        guard let dateString = dateString else {
            return nil
        }
        do {
            let date = try Date(dateString, strategy: .iso8601)
            return date.formatted(date: .abbreviated, time: .omitted)
        } catch {
            return nil
        }
    }

    private func formatStatus(_ status: String) -> String {
        status
            .replacingOccurrences(of: "_", with: " ")
            .uppercased()
    }
}
