import UIKit
import Photos

class OpenCameraPrivyViewController: UIViewController {
    
    @IBOutlet weak var captureBtn: UIButton!
    var imagePreview: UIImage!
    let cameraController = FrontCameraController()
    @IBOutlet weak var circleProgress: CircleView!
    var imageArray = [Data]()
}

extension OpenCameraPrivyViewController {
    override func viewDidLoad() {
        circleProgress.progressClr = UIColor(red: 0.38, green: 0.847, blue: 0, alpha: 1)

        let backSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        backSwipe.direction = .right
        view.addGestureRecognizer(backSwipe)

        func configureCameraController() {
            cameraController.prepare {(error) in
                if let error = error {
                    print(error)
                }
                try? self.cameraController.displayPreview(on: self.circleProgress)
                
            }
        }
        
        func styleCaptureButton() {
            captureBtn.layer.borderColor = UIColor.black.cgColor
            captureBtn.layer.borderWidth = 2
            captureBtn.layer.cornerRadius = min(captureBtn.frame.width, captureBtn.frame.height) / 2
        }
        
        styleCaptureButton()
        configureCameraController()
        
        print()
        
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        if sender.state == .ended{
            switch sender.direction {
            case .right:
                print("swipe")
            default:
                break
            }
        }
    }
}

extension OpenCameraPrivyViewController{
    
    func takePhoto(jumlah : Int){

            cameraController.captureImage {(image, error) in
            guard let image = image else {
            print(error ?? "Image capture error")
                return
            }
            
            try? PHPhotoLibrary.shared().performChangesAndWait {
                PHAssetChangeRequest.creationRequestForAsset(from: image)
                self.imageArray.append(image.pngData()!)
                let percentProgress = Float(Float(self.imageArray.count)*100.0/1000.0)
                self.circleProgress.setProgressWithAnimation(duration: 1, value: percentProgress)
                print(percentProgress)
            }

        }
    }
    
    @IBAction func takePicture(_sender: UIButton){
    
            if imageArray.isEmpty{

                var count = 0
                _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ t in
                    count += 1
                    self.takePhoto(jumlah: count)

                    print(count)
                    if count >= 8 {
                        t.invalidate()
                    }
                }

            }else{
                imageArray.removeAll()

                var count = 0
                _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ t in
                    count += 1
                    self.takePhoto(jumlah: count)

                    print(count)
                    if count >= 8 {
                        t.invalidate()
                    }
                }
            }
                
        }
    }
