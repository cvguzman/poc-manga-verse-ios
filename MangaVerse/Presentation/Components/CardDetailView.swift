import SwiftUI

struct CardDetailView: View {
    @Environment(\.dismiss) private var isPresented
    @State var item: MangaModel

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(uiImage: item.mainPicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.title)
                        .bold()
                    Group {
                        HStack {
                            if let startDate = item.startDate {
                                Text("Start date: \(startDate)")
                            }
                            if let endDate = item.endDate {
                                Text("End date: \(endDate)")
                            }
                        }
                        HStack {
                            if let volumes = item.volumes {
                                Text("Volumes: \(volumes)")
                            }
                            if let chapters = item.chapters {
                                Text("Chapters: \(chapters)")
                            }
                        }
                        HStack {
                            Text("score: \(item.score)")
                            Text("status: \(item.status.capitalized)")
                        }
                    }
                    .foregroundStyle(.foreground)
                    Text("Authors")
                        .font(.title3)
                        .bold()
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(item.authors, id: \.id) { author in
                                HStack {
                                    Image(systemName: "person.fill")
                                    VStack(alignment: .leading) {
                                        Text("\(author.firstName) \(author.lastName)")
                                            .bold()
                                        Text(author.role)
                                            .italic()
                                    }
                                }
                                .font(.caption)
                                .foregroundStyle(.white)
                                .padding(6)
                                .background(
                                    .blue,
                                    in: RoundedRectangle(cornerRadius: 8)
                                )
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    Text("Genres")
                        .font(.title3)
                        .bold()
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(item.genres, id: \.id) { genre in
                                Text(genre.genre)
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .padding(6)
                                    .background(
                                        .blue,
                                        in: RoundedRectangle(cornerRadius: 8)
                                    )
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    Text("Demographics")
                        .font(.title3)
                        .bold()
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(item.demographics, id: \.id) { demographic in
                                Text(demographic.demographic)
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .padding(6)
                                    .background(
                                        .blue,
                                        in: RoundedRectangle(cornerRadius: 8)
                                    )
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    Text("Synopsis")
                        .font(.title3)
                        .bold()
                    if let synopsis = item.synopsis {
                        Text(synopsis)
                    }
                    Spacer()
                }
                .multilineTextAlignment(.leading)
            }
            .padding()
            .frame(maxWidth: 400, maxHeight: 500)
            .background(
                .white,
                in: UnevenRoundedRectangle(
                    topLeadingRadius: 20, bottomLeadingRadius: 0, bottomTrailingRadius: 0,
                    topTrailingRadius: 20))
        }
    }
}
