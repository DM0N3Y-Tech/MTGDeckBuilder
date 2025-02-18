import ScryfallKit

public struct MTGDeckBuilder {
    public init() {}

    public func fetchCard(named name: String) async throws -> Card? {
        let api = ScryfallAPI()
        let cards = try await api.searchCards(query: name)
        return cards.first
    }
}
