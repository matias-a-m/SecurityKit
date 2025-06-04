#if canImport(LocalAuthentication)
import LocalAuthentication
#endif

@available(iOS 15.0, macOS 10.15, *)
public class SecurityKitBiometrics {
    public static func authenticateWithBiometrics(completion: @escaping (Bool) -> Void) {
        #if canImport(LocalAuthentication)
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Autenticarse para acceder a los datos") { success, _ in
                DispatchQueue.main.async {
                    completion(success)
                }
            }
        } else {
            DispatchQueue.main.async {
                completion(false)
            }
        }
        #else
        completion(false)
        #endif
    }
}
