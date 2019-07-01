//
//  Utilities.swift
//  SwiftNews
//
//  Created by Alfredo Fernandes on 2019-07-01.
//  Copyright © 2019 Alfredo Fernandes. All rights reserved.
//

import Foundation
import UIKit

public class Utilities {
    public static func getImage(fromURL url: URL) -> UIImage? {
        do {
            let imageData = try Data(contentsOf: url)
            
            return UIImage(data: imageData)!
        } catch {
            return nil
        }
    }
}
