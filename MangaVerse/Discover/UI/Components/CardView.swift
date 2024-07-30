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
                    .foregroundStyle(.primary)
                    .bold()
                    .multilineTextAlignment(.leading)
                Text(String(format: "%.2f", item.score))
                    .font(.footnote)
                    .foregroundStyle(.green)
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
}
