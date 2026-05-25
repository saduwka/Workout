import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    @Query(sort: \Workout.date, order: .reverse) private var workouts: [Workout]

    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            Group {
                if workouts.isEmpty {
                    emptyState
                } else {
                    workoutList
                }
            }
            .navigationTitle("Тренировки")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.startNewWorkout()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .createWorkout:
                    CreateWorkoutView(navigationPath: $viewModel.navigationPath)
                }
            }
        }
    }

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "dumbbell")
                .font(.system(size: 60))
                .foregroundStyle(.secondary)
            Text("Нет тренировок")
                .font(.title2)
                .fontWeight(.semibold)
            Text("Нажми «+», чтобы создать первую тренировку")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            Button("Новая тренировка") {
                viewModel.startNewWorkout()
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 8)
        }
        .padding()
    }

    private var workoutList: some View {
        List(workouts) { workout in
            VStack(alignment: .leading, spacing: 4) {
                Text(workout.name.isEmpty ? "Без названия" : workout.name)
                    .font(.headline)
                HStack {
                    Text(workout.type.isEmpty ? "Тип не указан" : workout.type)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(workout.date.formatted(date: .abbreviated, time: .omitted))
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.vertical, 4)
        }
    }
}

#Preview {
    HomeView()
        .modelContainer(for: Workout.self, inMemory: true)
}
