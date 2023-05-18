//
//  UIImageView+ImageFromURL.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 17/05/23.
//

import Foundation
import UIKit

extension UIImageView {

    public func imageFromUrl(_ url: URL?) {
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    // TODO: Placeholder image
                    return
                }
                
                DispatchQueue.main.async { /// execute on main thread
                    self.image = UIImage(data: data)
                }
            }
            self.image = UIImage.gifImageWithName("loading")
            task.resume()
        }
    }
    
}
