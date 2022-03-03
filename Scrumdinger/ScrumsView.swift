import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        List {
            // scrumsはIdentifiableの配列なのでid:を指定する必要はない
            ForEach(scrums) { scrum in
                // NavigationLinkに渡すと自動でインジケータが追加される
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }.listRowBackground(scrum.theme.mainColor)
            }
          // 子ビューに影響させることができる
        }.navigationTitle("Daily Scrums").toolbar {
            Button(action: {}) {
                Image(systemName: "plus")
            }.accessibilityLabel("New Scrum")
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
