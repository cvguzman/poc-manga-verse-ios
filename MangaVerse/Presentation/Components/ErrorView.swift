import SwiftUI

struct ErrorView: View {
    var text: String = "Oops something went wrong"
    var systemNameImage: String = "wrongwaysign.fill"
    var retryAction: (() -> Void)? = nil

    var body: some View {
        Image(systemName: systemNameImage)
            .foregroundStyle(.gray)
        Text(text)
        if let retryAction {
            Button {
                retryAction()
            } label: {
                Text("Retry")
            }
        }
    }
}
