//
//  ImageProcessing.swift
//  SwiftImagePerformanceExperiment
//
//  Created by Yuta Koshizawa on 2020/06/28.
//  Copyright © 2020 koherent.org. All rights reserved.
//

import UIKit
import SwiftImage

func loadImage() -> UIImage {
    let inputImage: UIImage = UIImage(
        contentsOfFile: Bundle.main.path(forResource: "LargeImage", ofType: "jpg")!
    )!

    let image = Image<RGBA<UInt8>>(uiImage: inputImage)
    let xRange = 1 ..< 2161
    let yRange = 1316 ..< 2525
    let cropped = Image<RGBA>(image[xRange, yRange])
    let resized = cropped.resizedTo(width: 2736, height: 1530)
    
    let outputImage: UIImage = resized.uiImage
    
    return outputImage
}
