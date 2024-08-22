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
                        .font(.title2)
                        .bold()
                    Group {
                        HStack {
                            if let startDate = item.startDate {
                                Text("start date: \(startDate)")
                            }
                            if let endDate = item.endDate {
                                Text("end date: \(endDate)")
                            }
                        }
                        HStack {
                            if let volumes = item.volumes {
                                Text("volumes: \(volumes)")
                            }
                            if let chapters = item.chapters {
                                Text("chapters: \(chapters)")
                            }
                        }
                        HStack {
                            Text("score: \(item.score)")
                            Text("status: \(item.status)")
                        }
                    }
                    .font(.callout)
                    .foregroundStyle(.placeholder)
                    Text("Authors")
                        .font(.callout)
                        .bold()
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(item.authors, id: \.id) { author in
                                Label(
                                    "\(author.firstName) \(author.lastName)\n\(author.role)",
                                    systemImage: "person.fill"
                                )
                                .padding()
                                .foregroundStyle(.white)
                                .background(
                                    .placeholder,
                                    in: RoundedRectangle(cornerRadius: 8)
                                )
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    Text("Genres")
                        .font(.callout)
                        .bold()
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(item.genres, id: \.id) { genre in
                                Text(genre.genre)
                                    .padding()
                                    .foregroundStyle(.white)
                                    .background(
                                        .placeholder,
                                        in: Capsule()
                                    )
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    Text("Demographics")
                        .font(.callout)
                        .bold()
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(item.demographics, id: \.id) { demographic in
                                Text(demographic.demographic)
                                    .padding()
                                    .foregroundStyle(.white)
                                    .background(
                                        .placeholder,
                                        in: Capsule()
                                    )
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    Text("Synopsis")
                        .font(.callout)
                        .bold()
                    if let synopsis = item.synopsis {
                        Text(synopsis)
                            .font(.caption)
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
