![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat)
![Language](https://img.shields.io/badge/Language-Swift%203.0-yellow.svg)
![License](https://img.shields.io/badge/Lisence-Apache%202.0-brightgreen.svg)

<sub>QR-BARCode-ScannerGenerator</sub>
-
* Simple solution for scanning BarCodes and QR Codes.
* Also Generate QR-Code and Bar-Code.
* No Required to write too much code

| Creating Bar Code |
| ------------- |
|![ScreenShot](https://s3.amazonaws.com/cocoacontrols_production/uploads/control_image/image/10586/UNADJUSTEDNONRAW_thumb_8e.jpg)|



<sub>How to add code into your project</sub>
-
<sub>Add Following File to your project</sub>
-
 - ```Qr-Barcode-Genrator.swift```


<sub>Import AVFoundation in your controller where to use</sub>
-
```javascript
import AVFoundation
```

<sub>Write Simple Code in your Method To generate QR/Bar Code</sub>
-
For Creating bar code just call method send Text and type as parameter
```javascript
let image =  Qr_Barcode_Genrator.sharedInstance.generateCode(string: textField.text!, type: selectedType!)
imageView.image = image
```
You can get types of barcode by using following code.
```javascript
Qr_Barcode_Genrator.sharedInstance.getTypesOfCode()
```

<sub>Write Simple Code in your Method To Scan QR/Bar Code</sub>
-
For Creating bar code just call method send your viewController instance and type as parameter
```javascript
Qr_Barcode_Genrator.sharedInstance.scanCode(fromViewController: self, selectedType: [selectedType!])
```
You can get types of barcode by using following code.
```javascript
Qr_Barcode_Genrator.sharedInstance.getTypesOfCode()
```

<sub>Bug, Suggestions</sub>
-
All you need is open an [issue](https://github.com/Tangdixi/DCQRCode/issues), I'll answer it ASAP !


<sub>License</sub>
-
QR-BARCode-ScannerGenerator is released under the Apache license. See LICENSE for details.
