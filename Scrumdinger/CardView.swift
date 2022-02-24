import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    
    // some View で「Viewというプロトコルを批准した何かの型」という意味
    var body: some View {
        VStack(alignment: .leading) {
            // headline で太字
            Text(scrum.title).font(.headline)
                // headingである文字を読んでくれる
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3").accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock").labelStyle(.trailingIcon).accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                // HStack全体のフォントに対してつけてる
            }.font(.caption)
        }.padding().foregroundColor(scrum.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleData[0]
    static var previews: some View {
        CardView(scrum: scrum).background(scrum.theme.mainColor).previewLayout(.fixed(width: 400, height: 60))
    }
}
