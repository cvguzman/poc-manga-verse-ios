import SwiftUI

struct DiscoverView: View {
    var body: some View {
        NavigationView(content: {
            List {
                NavigationLink {
                    EmptyView()
                } label: {
                    Button(action: {}, label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Monster")
                                    .font(.title)
                                    .bold()
                                Text("Sub")
                                    .font(.title2)
                            }
                            .foregroundStyle(.white)
                            Spacer()
                        }
                        .padding()
                    })
                }
                .background(
                    ZStack {
                        AsyncImage(url: URL(string: "https://cdn.myanimelist.net/images/manga/1/157897l.jpg"), scale: 1.6)
                            .scaledToFill()
                            .opacity(0.6)
                        LinearGradient(gradient: Gradient(colors: [.black, .gray, .white, .white]), startPoint: .leading, endPoint: .trailing)
                            .ignoresSafeArea()
                            .opacity(0.8)
                    }
                )
            }
            .navigationTitle("Discover")
        })
    }
}

#Preview {
    DiscoverView()
}
