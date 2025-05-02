
import Foundation

public protocol JSONEncodable {
    func encodeToJSON() -> Any
}

// Default implementation for Encodable types
extension JSONEncodable where Self: Encodable {
    public func encodeToJSON() -> Any {
        let encoder = JSONEncoder()
        // Use a DateFormatter instead of ISO8601DateFormatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        
        guard let data = try? encoder.encode(self),
              let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else {
            return String(describing: self)
        }
        return jsonObject
    }
}

// Implementation for basic types
extension String: JSONEncodable {
    public func encodeToJSON() -> Any {
        return self
    }
}

extension Int: JSONEncodable {
    public func encodeToJSON() -> Any {
        return self
    }
}

extension Int64: JSONEncodable {
    public func encodeToJSON() -> Any {
        return self
    }
}

extension Float: JSONEncodable {
    public func encodeToJSON() -> Any {
        return self
    }
}

extension Double: JSONEncodable {
    public func encodeToJSON() -> Any {
        return self
    }
}

extension Bool: JSONEncodable {
    public func encodeToJSON() -> Any {
        return self
    }
}

extension Array: JSONEncodable where Element: JSONEncodable {
    public func encodeToJSON() -> Any {
        return self.map { $0.encodeToJSON() }
    }
}

extension Dictionary: JSONEncodable where Key == String, Value: JSONEncodable {
    public func encodeToJSON() -> Any {
        var dict = [String: Any]()
        for (key, value) in self {
            dict[key] = value.encodeToJSON()
        }
        return dict
    }
}
