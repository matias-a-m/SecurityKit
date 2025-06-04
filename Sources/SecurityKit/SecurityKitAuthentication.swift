import Foundation

@available(iOS 15.0, macOS 10.15, *)
public class SecurityKitAuthentication {
    public static func authenticate(completion: @escaping (Bool) -> Void) {
        SecurityKitBiometrics.authenticateWithBiometrics { success in
            completion(success)
        }
    }
}

