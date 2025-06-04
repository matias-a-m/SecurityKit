import Foundation
#if canImport(Security)
import Security
#endif

@available(iOS 15.0, macOS 10.15, *)
public class SecurityKitKeychain {
    public static func saveToKeychain(data: Data, forKey key: String) {
#if canImport(Security)
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: data
        ]
        SecItemAdd(query as CFDictionary, nil)
#else
        // Keychain not available on this platform
#endif
    }

    public static func retrieveFromKeychain(forKey key: String) -> Data? {
#if canImport(Security)
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        var item: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &item)

        if status == errSecSuccess, let data = item as? Data {
            return data
        }

        return nil
#else
        return nil
#endif
    }
}
