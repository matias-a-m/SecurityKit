# SecurityKit

**SecurityKit** es un framework modular diseñado para implementar funciones de seguridad críticas en aplicaciones iOS/macOS, como **cifrado**, **almacenamiento seguro** en el **Keychain**, y **autenticación biométrica** (FaceID/TouchID).

---

## Características principales

- **Cifrado y descifrado de datos** con algoritmos estándar.
- **Almacenamiento seguro** usando el **Keychain** de iOS/macOS.
- **Autenticación biométrica**: Integración de **FaceID/TouchID**.
- **Acceso controlado y seguro** a recursos sensibles.
- **Facilidad de integración** en proyectos iOS/macOS.

---

## Requisitos

- **iOS**: 15.0 o superior
- **macOS**: 10.15 o superior
- **Swift**: 6 o superior
- **Dependencias**: Sin dependencias externas, completamente autónomo.

---

## Instalación

### Usando Swift Package Manager

Añade la siguiente dependencia en tu archivo `Package.swift`:

```swift
.package(url: "https://github.com/tuusuario/SecurityKit", from: "1.0.0")
```

Importa el framework en tu código:

```swift
import SecurityKit
```

---

## Ejemplo de Uso

### Cifrado y Descifrado

```swift
let plaintext = "Sensitive Data"
let encryptedData = SecurityKit.encrypt(data: plaintext)
let decryptedData = SecurityKit.decrypt(data: encryptedData)
```

### Almacenamiento Seguro en Keychain

```swift
SecurityKit.saveToKeychain(data: encryptedData, forKey: "SensitiveDataKey")
let retrievedData = SecurityKit.retrieveFromKeychain(forKey: "SensitiveDataKey")
```

### Autenticación Biométrica

```swift
SecurityKit.authenticateWithBiometrics { success in
    if success {
        print("Autenticación exitosa")
    } else {
        print("Autenticación fallida")
    }
}
```

---

## Licencia

MIT © Matías A. Molina
