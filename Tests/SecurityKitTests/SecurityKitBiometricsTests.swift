import XCTest
@testable import SecurityKit

@available(iOS 15.0, macOS 10.15, *)
final class SecurityKitBiometricsTests: XCTestCase {
    func testBiometricAuthentication() {
        let expectation = self.expectation(description: "Authentication should succeed")
        SecurityKitBiometrics.authenticateWithBiometrics { success in
            XCTAssertTrue(success)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}