import SwiftUI

struct CardView: View {
    let model: MangaEntity

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: cleanCoverURL(model.mainPicture)), scale: 1.6)
                .scaledToFill()
                .frame(width: 180, height: 200)
                .mask {
                    LinearGradient(
                        colors: [.clear, .black],
                        startPoint: .bottom,
                        endPoint: .center)
                }
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.title2)
                    .bold()
                Text("\(model.score)")
                    .font(.title3)
                    .foregroundStyle(.placeholder)
            }
            .padding([.horizontal, .bottom])
        }
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay {
            RoundedRectangle(cornerRadius: 18)
                .stroke(.placeholder, lineWidth: 1)
        }
    }

    func cleanCoverURL(_ url: String) -> String {
        url.replacingOccurrences(of: "\"", with: String())
    }
}
