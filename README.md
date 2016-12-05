![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat)
![Language](https://img.shields.io/badge/Language-Objective----C-yellowgreen.svg)

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

suggestions are always welcome.

## License

QR-BARCode-ScannerGenerator is released under the Apache license. See LICENSE for details.
