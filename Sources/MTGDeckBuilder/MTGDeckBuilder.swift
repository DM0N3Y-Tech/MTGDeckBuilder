import Foundation

public struct MTGDeckBuilder {
    
    public init() {}

    /// Fetches a card from the Scryfall API by name.
    public func fetchCard(named name: String) async throws -> ScryfallCard? {
        let urlString = "https://api.scryfall.com/cards/named?fuzzy=\(name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? name)"
        
        guard let url = URL(string: urlString) else {
            throw MTGDeckBuilderError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue("MTGDeckBuilder/1.0 (contact: your-email@example.com)", forHTTPHeaderField: "User-Agent")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MTGDeckBuilderError.invalidResponse
        }

        let card = try JSONDecoder().decode(ScryfallCard.self, from: data)
        return card
    }
}

/// Defines the expected Scryfall API response model.
public struct ScryfallCard: Codable {
    public let name: String
    public let mana_cost: String?
    public let type_line: String
    public let oracle_text: String?
    public let image_uris: CardImages?
}

/// Defines the structure for card images.
public struct CardImages: Codable {
    public let normal: String?
    public let art_crop: String?
}

/// Custom errors for MTGDeckBuilder.
public enum MTGDeckBuilderError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}
