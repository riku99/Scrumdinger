import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            // LabelStyleのstructなので configuration は LabelStyleConfiguration である
            configuration.title
            configuration.icon
        }
    }
}

// TrailingIconLabelStyleを準拠しているLabelStyleにのみを拡張
extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self {Self()}
}
