import SwiftUI
import SwiftData

struct CreateWorkoutView: View {
    @Binding var navigationPath: [AppRoute]
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel = CreateWorkoutViewModel()

    var body: some View {
        Form {
            Section("Название") {
                TextField("Например: Грудь и трицепс", text: $viewModel.name)
            }

            Section("Сложность") {
                Picker("Сложность", selection: $viewModel.difficulty) {
                    ForEach(viewModel.difficultyLevels, id: \.self) { level in
                        Text(level).tag(level)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle("Новая тренировка")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Сохранить") {
                    saveWorkout()
                }
                .fontWeight(.semibold)
            }
        }
    }

    private func saveWorkout() {
        let workout = Workout()
        workout.name = viewModel.name
        workout.type = viewModel.difficulty
        workout.date = Date()
        modelContext.insert(workout)
        navigationPath.removeLast()
    }
}

#Preview {
    NavigationStack {
        CreateWorkoutView(navigationPath: .constant([]))
            .modelContainer(for: Workout.self, inMemory: true)
    }
}
