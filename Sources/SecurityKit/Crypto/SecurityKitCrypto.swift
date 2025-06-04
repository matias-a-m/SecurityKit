import Foundation
#if canImport(CryptoKit)
import CryptoKit
#endif

@available(iOS 15.0, macOS 10.15, *)
public class SecurityKitCrypto {
    public static func encrypt(data: String) -> Data? {
#if canImport(CryptoKit)
        let key = SymmetricKey(size: .bits256)
        let dataToEncrypt = data.data(using: .utf8)!
        
        do {
            let encryptedData = try AES.GCM.seal(dataToEncrypt, using: key).combined
            return encryptedData
        } catch {
            print("Error al cifrar: \(error)")
            return nil
        }
#else
        return nil
#endif
    }

    public static func decrypt(data: Data) -> String? {
#if canImport(CryptoKit)
        let key = SymmetricKey(size: .bits256)
        
        do {
            let sealedBox = try AES.GCM.SealedBox(combined: data)
            let decryptedData = try AES.GCM.open(sealedBox, using: key)
            return String(data: decryptedData, encoding: .utf8)
        } catch {
            print("Error al descifrar: \(error)")
            return nil
        }
#else
        return nil
#endif
    }

    public static func sha256(data: String) -> String? {
#if canImport(CryptoKit)
        let inputData = Data(data.utf8)
        let hashed = SHA256.hash(data: inputData)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
#else
        return nil
#endif
    }

    public static func hmac(key: String, data: String) -> String? {
#if canImport(CryptoKit)
        let keyData = SymmetricKey(data: Data(key.utf8))
        let dataToHash = Data(data.utf8)
        let authenticationCode = HMAC<SHA256>.authenticationCode(for: dataToHash, using: keyData)
        return authenticationCode.compactMap { String(format: "%02x", $0) }.joined()
#else
        return nil
#endif
    }
}

