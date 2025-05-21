import XCTest
import GenesysCloudMessenger

final class PackageTests: XCTestCase {
    func testImport() {
        XCTAssertNotNil(GenesysCloudMessenger.MessengerAccount.self)
    }
}
