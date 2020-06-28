//
//  ImageProcessing.swift
//  SwiftImagePerformanceExperiment
//
//  Created by Yuta Koshizawa on 2020/06/28.
//  Copyright © 2020 koherent.org. All rights reserved.
//

import UIKit
import SwiftImage
import CoreImage

func loadImage(usingCoreImage usesCoreImage: Bool) -> UIImage {
    let inputImage: UIImage = UIImage(
        contentsOfFile: Bundle.main.path(forResource: "LargeImage", ofType: "jpg")!
    )!

    let image = Image<RGB<UInt8>>(uiImage: inputImage)
    let xRange = 1 ..< 2161
    let yRange = 1316 ..< 2525
    let cropped = Image(image[xRange, yRange])
    let outputImage: UIImage
    if usesCoreImage {
        outputImage = cropped.withCGImage { cgImage in
            let ciImage = CIImage(cgImage: cgImage)
            
            let filter = CIFilter(name: "CILanczosScaleTransform")!
            filter.setValue(ciImage, forKey: kCIInputImageKey)
            let scale = NSNumber(value: 2736.0 / Double(cropped.width))
            filter.setValue(scale, forKey: kCIInputScaleKey)
            filter.setValue(NSNumber(value: 1.0 as Float), forKey: kCIInputAspectRatioKey)
            let output = filter.value(forKey: kCIOutputImageKey) as! CIImage
            let context = CIContext(options: [.useSoftwareRenderer: false])
            return UIImage(cgImage: context.createCGImage(output, from: output.extent)!)
        }
    } else {
        let resized: Image<RGB<UInt8>> = cropped.resizedTo(width: 2736, height: 1530)
        outputImage = resized.uiImage
    }
    
    return outputImage
}
