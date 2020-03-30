import Foundation

extension Encodable {
    // Try to get a dictionary from an encodable, if it encounters any error it will return an empty dictionary
    var dictionary: [String: Any] {
    guard let data = try? JSONEncoder().encode(self) else { return [:] }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { ($0 as! [String: Any]) } ?? [:]
  }
}
