import SwiftUI

struct ErrorView: View {
    let retryAction: () -> Void

    var body: some View {
        Text("Oops something went wrong")
        Button {
            retryAction()
        } label: {
            Text("Retry")
        }
    }
}
