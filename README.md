# H3S PDF Utility SDK

`H3SPDFUTILSDK` is a **lightweight iOS SDK** for PDF signing.  
It supports **digital PKCS#12 signatures**, **wet signatures**, and **signature placeholders** while providing **offline license enforcement**.

---

## Features
- Add **signature placeholders** with metadata.  
- Add **wet signatures** (image-based).  
- Sign documents digitally using **PKCS# signature data**.  
- Keep track of updated PDF data via `updatedPDF`.  
- Supports **async/await** APIs for smooth integration.  
- Built-in **logging** via `LogLevel`.  

---

## Installation

### Swift Package Manager
Add this to your `Package.swift`:

```swift
.package(url: "https://github.com/h3sventures/H3S-PDFUtility.git", from: "1.0.0")

.target(
    name: "YourApp",
    dependencies: ["H3SPDFUTILSDK"]
)
```
---

## Getting Started with H3SPDFUTILSDK

This guide walks you through **installation, licensing, and your first signature**.

---

### Initialize SDK

```swift
import H3SPDFUTILSDK

let pdfData: Data = ... // Your PDF data
let licenseKey = "YOUR_LICENSE_KEY"

let pdfSDK = H3SPDFUTILSDK(
    data: pdfData,
    licenseKey: licenseKey,
    logLevel: .info
)

---
`updatedPDF` will initially hold the input PDF data.

## Digital Signature
### Add Signature Placeholder

```swift
Task {
    do {
        let hashData = try await pdfSDK.addSignaturePlaceholder(
            additionalInfo: [
                PDFSignatureInfo(name: "John Doe"),
                PDFSignatureInfo(contactInfo: "john@example.com")
            ],
            placeholderLength: 16384,
            position: .bottomRight,
            onPage: .lastPage
        )
        print("Placeholder added. Hash: \(hashData?.base64EncodedString() ?? "N/A")")
    } catch {
        print("Failed to add placeholder: \(error)")
    }
}

---

#### Parameters:
- additionalInfo: Optional array of PDFSignatureInfo
- placeholderLength: Optional placeholder size (default: 16384)
- position: Optional SignaturePosition (default: .bottomLeft)
- onPage: Optional SignaturePage (default: .lastPage)

### Sign Document

```swift
Task {
    do {
        let signatureData: Data = ... // PKCS# signature data
        let signedPDF = try await pdfSDK.signDocument(signatureData: signatureData)
        print("Document signed. Size: \(signedPDF?.count ?? 0) bytes")
    } catch {
        print("Failed to sign document: \(error)")
    }
}

---

## Wet/Image Signature

### Add Wet Signature or Image

```swift
Task {
    do {
        try await pdfSDK.addWetSignatureOrImage(
            imageBase64: base64StringOfSignature,
            position: .bottomLeft,
            onPage: .firstPage
        )
        print("Wet signature added.")
    } catch {
        print("Failed to add wet signature: \(error)")
    }
}

---

## Additional options

### Access Updated PDF
```swift
let latestPDF = pdfSDK.updatedPDF

---

### Logging
```swift
enum LogLevel {
    case none, error, warning, info, debug
}

---