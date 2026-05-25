import Observation

@Observable final class CreateWorkoutViewModel {
    var name: String = ""
    var difficulty: String = "Beginner"
    let difficultyLevels = ["Beginner", "Intermediate", "Advanced"]
}
