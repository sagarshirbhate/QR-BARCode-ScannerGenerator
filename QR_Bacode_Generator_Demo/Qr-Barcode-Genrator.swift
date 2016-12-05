//
//  Qr-Barcode-Genrator.swift
//  QR_BARCODE_GENERATOR
//
//  Created by Sagar Shirbhate on 12/5/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

import UIKit
import AVFoundation
import UIKit

class Qr_Barcode_Genrator: NSObject , AVCaptureMetadataOutputObjectsDelegate{

    
    var supportedCodeTypes : Array<String>? // To save supported Type Global to this class
    var scanfromViewController : UIViewController? // To save temp view controller
    var captureSession:AVCaptureSession? // Capture session
    var videoPreviewLayer:AVCaptureVideoPreviewLayer? // Video Preview layer
    var qrCodeFrameView:UIView? // Show Square or line view
    
    
    // Make Singlton Instance
    static let sharedInstance: Qr_Barcode_Genrator = { Qr_Barcode_Genrator() }()
    
    
    
    // To Get Barcode types
    func getTypesOfCode() -> Array<[String:String]> {
        
        var myNewDictArray: [Dictionary<String, String>] = []
        
   
       var codes = ["Display Text": "Bar Code" , "Scan_Code": AVMetadataObjectTypeCode128Code, "Gen_Code": "CICode128BarcodeGenerator"]
        
        myNewDictArray.append(codes)
        
        
        codes = ["Display Text": "QR Code" , "Scan_Code": AVMetadataObjectTypeQRCode, "Gen_Code": "CIQRCodeGenerator"]
        
        myNewDictArray.append(codes)
        
        
        return myNewDictArray as Array
    }
    
    
    // scan QR/BacCode From Your View Controller :  pass your view controller and type of code you can set multiple types too.
    
    func scanCode(fromViewController: UIViewController , selectedType: Array<String>){
    
        
        scanfromViewController = fromViewController
        supportedCodeTypes = selectedType
        
        // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video as the media type parameter.
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Initialize the captureSession object.
            captureSession = AVCaptureSession()
            
            // Set the input device on the capture session.
            captureSession?.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = selectedType //supportedCodeTypes
            
            // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer?.frame = fromViewController.view.frame
            fromViewController.view.layer.addSublayer(videoPreviewLayer!)
            
            // Start video capture.
            captureSession?.startRunning()
            
            
            // Initialize QR Code Frame to highlight the QR code
            qrCodeFrameView = UIView()
            
            if let qrCodeFrameView = qrCodeFrameView {
                qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                qrCodeFrameView.layer.borderWidth = 2
                fromViewController.view.addSubview(qrCodeFrameView)
                fromViewController.view.bringSubview(toFront: qrCodeFrameView)
            }
            
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
    }
    
    
    
    
    
    // MARK: - AVCaptureMetadataOutputObjectsDelegate Methods
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            //Barcode Not Detected
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if (supportedCodeTypes?.contains(metadataObj.type))! {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                
                
                // When Code scanned this will invoke now only alert is shown you can write your code here like compltetion handler etc..
                
                let alert = UIAlertController(title: "Bar Code Found", message: metadataObj.stringValue!, preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive, handler: { action in
                    alert.dismiss(animated: true, completion: nil)
                }))
                
                scanfromViewController?.present(alert, animated: true, completion: nil)
            }
        }
    }

    
    
    
    // For generating code from any text 
    func generateCode(string: String , type: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: type) {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.applying(transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    
    
    
    
    
    
}
