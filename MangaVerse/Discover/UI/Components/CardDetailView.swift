import SwiftUI

struct CardDetailView: View {
    @Environment(\.dismiss) private var isPresented
    @State var item: MangaModel

    var body: some View {
        ZStack(alignment: .top) {
            Image(uiImage: item.mainPicture)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 200)
            Text(item.title)
        }
//        VStack {
//            AsyncImage(url: URL(string: cleanCoverURL(model.mainPicture)))
//            ZStack(alignment: .center) {
//                ScrollView {
//                    Text(model.title)
//                    Text(model.status)
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//            }
//            .background(.blue)
//            .clipShape(RoundedRectangle(cornerRadius: 18))
//            .ignoresSafeArea(.container)
//        }
//        ZStack(alignment: .top) {
//            AsyncImage(url: URL(string: cleanCoverURL(model.mainPicture)))
//            ZStack(alignment: .bottom) {
//                ScrollView {
//                    VStack(alignment: .leading) {
//                        Text(model.title)
//                        Text(model.status)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .background(.white)
//                    .clipShape(RoundedRectangle(cornerRadius: 18))
//                }
//            }
//        }
    }
}

func cleanCoverURL(_ url: String) -> String {
    url.replacingOccurrences(of: "\"", with: String())
}
