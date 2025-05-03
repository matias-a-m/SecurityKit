import XCTest
@testable import SecurityKit

@available(iOS 15.0, macOS 10.15, *)
final class SecurityKitCryptoTests: XCTestCase {
    func testEncryptDecrypt() {
        let originalData = "Sensitive Data"
        guard let encryptedData = SecurityKitCrypto.encrypt(data: originalData) else {
            XCTFail("Cifrado fallido")
            return
        }
        let decryptedData = SecurityKitCrypto.decrypt(data: encryptedData)
        XCTAssertEqual(originalData, decryptedData)
    }

    func testSHA256() {
        let originalData = "Sensitive Data"
        let hashed = SecurityKitCrypto.sha256(data: originalData)
        XCTAssertNotNil(hashed)
    }

    func testHMAC() {
        let key = "secretKey"
        let data = "Sensitive Data"
        let hmac = SecurityKitCrypto.hmac(key: key, data: data)
        XCTAssertNotNil(hmac)
    }
}