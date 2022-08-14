import Foundation

public extension String {

    func asUrl() -> URL? {
        URL(string: self)
    }
    
    var isValidUrl: Bool {
        URL(string: self) != nil
    }
}
