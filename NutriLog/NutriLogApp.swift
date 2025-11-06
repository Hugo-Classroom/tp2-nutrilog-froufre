import SwiftUI
import SwiftData

@main
struct NutriLogApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
        .modelContainer(PersistenceController.shared.container)
    }
}
