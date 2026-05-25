import Observation

enum AppRoute: Hashable {
    case createWorkout
}

@Observable final class HomeViewModel {
    var navigationPath: [AppRoute] = []

    func startNewWorkout() {
        navigationPath.append(.createWorkout)
    }
}
