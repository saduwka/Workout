import SwiftData
import Foundation

@Model final class Workout {
    var id: UUID = UUID()
    var name: String = ""
    var date: Date = Date()
    var type: String = ""
    var notes: String? = nil
}
