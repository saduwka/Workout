import Foundation

struct ExerciseDTO: Decodable {
    let id: String
    let name: String
    let bodyPart: String
    let gifUrl: String?
}

final class ExerciseService {
    func fetch() async throws -> [ExerciseDTO] {
        guard let url = URL(string: Constants.API.exerciseDBURL) else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.addValue(Constants.API.exerciseDBApiKey, forHTTPHeaderField: "x-rapidapi-key")
        request.addValue(Constants.API.exerciseDBHost,   forHTTPHeaderField: "x-rapidapi-host")

        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode([ExerciseDTO].self, from: data)
    }
}
