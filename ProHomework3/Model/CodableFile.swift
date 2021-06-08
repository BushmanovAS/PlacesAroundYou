import Foundation

struct Places: Codable {
    var meta: Meta?
    var response: Response?
}

struct Meta: Codable {
    var code: Int?
    var requestId: String?
}

struct Response: Codable {
    var suggestedFilters: SuggestedFilters?
    var suggestedRadius: Int?
    var headerLocation: String?
    var headerFullLocation: String?
    var headerLocationGranularity: String?
    var query: String?
    var totalResults: Int?
    var suggestedBounds: SuggestedBounds?
    var groups: [Groups]?
}

struct SuggestedFilters: Codable {
    var header: String?
    var filters: [Filters]?
}

struct Filters: Codable {
    var name: String?
    var key: String?
}

struct SuggestedBounds: Codable {
    var ne: Ne?
    var sw: Sw?
}

struct Ne: Codable {
    var lat: Double?
    var lng: Double?
}

struct Sw: Codable {
    var lat: Double?
    var lng: Double?
}

struct Groups: Codable {
    var type: String?
    var name: String?
    var items: [Items]?
}

struct Items: Codable {
    var reasons: Reasons?
    var venue: Venue?
    var referralId: String?
}

struct Reasons: Codable {
    var count: Int?
    var items: [ReasonsItems]?
}

struct ReasonsItems: Codable {
    var summary: String?
    var type: String?
    var reasonName: String?
}

struct Venue: Codable {
    var id: String?
    var name: String?
    var location: Location?
    var categories: [Categories]?
    var photos: Photos?
    var venuePage: VenuePage?
}

struct Location: Codable {
    var address: String?
    var crossStreet: String?
    var lat: Double?
    var lng: Double?
    var labeledLatLngs: [LabeledLatLngs]?
    var distance: Int?
    var postalCode: String?
    var cc: String?
    var city: String?
    var state: String?
    var country: String?
    var formattedAddress: [String]?
}

struct LabeledLatLngs: Codable {
    var label: String?
    var lat: Double?
    var lng: Double?
}

struct Categories: Codable {
    var id: String?
    var name: String?
    var pluralName: String?
    var shortName: String?
    var icon: Icon?
    var primary: Bool?
}

struct Icon: Codable {
    var prefix: String?
    var suffix: String?
}

struct Photos: Codable {
    var count: Int?
    var groups: [String]?
}

struct VenuePage: Codable {
    var id: String?
}

