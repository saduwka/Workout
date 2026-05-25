import SwiftData

@Model final class Exercise {
    @Attribute(.unique) var id: String = ""
    var name: String = ""
    var bodyPart: String = ""
    var gifUrl: String? = nil
}
