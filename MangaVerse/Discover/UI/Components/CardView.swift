import SwiftUI

struct CardView: View {
    let item: MangaModel

    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: item.mainPicture)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .mask {
                    LinearGradient(
                        colors: [.clear, .black],
                        startPoint: .bottom,
                        endPoint: .center)
                }
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    .bold()
                    .multilineTextAlignment(.leading)
                Text(item.score)
                    .font(.footnote)
                    .bold()
                    .foregroundStyle(setColorBasedOnScore(item.score))
                    .foregroundStyle(.placeholder)
            }
            .padding([.horizontal, .bottom])
        }
        .frame(maxHeight: 250)
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay {
            RoundedRectangle(cornerRadius: 18)
                .stroke(.placeholder, lineWidth: 1)
        }
    }

    private func setColorBasedOnScore(_ score: String) -> Color {
        guard let score = Double(score) else {
            return .gray
        }
        switch score {
        case _ where score >= 7:
            return .green
        case _ where score >= 4:
            return .yellow
        default:
            return .red
        }
    }
}
