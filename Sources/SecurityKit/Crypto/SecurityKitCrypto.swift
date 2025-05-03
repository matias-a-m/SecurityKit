import Foundation
import CryptoKit

@available(iOS 15.0, macOS 10.15, *)
public class SecurityKitCrypto {
    public static func encrypt(data: String) -> Data? {
        let key = SymmetricKey(size: .bits256)
        let dataToEncrypt = data.data(using: .utf8)!
        
        do {
            let encryptedData = try AES.GCM.seal(dataToEncrypt, using: key).combined
            return encryptedData
        } catch {
            print("Error al cifrar: \(error)")
            return nil
        }
    }

    public static func decrypt(data: Data) -> String? {
        let key = SymmetricKey(size: .bits256)
        
        do {
            let sealedBox = try AES.GCM.SealedBox(combined: data)
            let decryptedData = try AES.GCM.open(sealedBox, using: key)
            return String(data: decryptedData, encoding: .utf8)
        } catch {
            print("Error al descifrar: \(error)")
            return nil
        }
    }
}