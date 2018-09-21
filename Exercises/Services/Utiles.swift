//
//  Utiles.swift
//  Exercises
//
//  Created by  Kostantin Zarubin on 17.09.2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import Foundation
import StoreKit

class Utiles {
    
    static func share(from viewController: UIViewController) {
        let shareText = "" // add this shit
        let vc = UIActivityViewController(activityItems: [shareText], applicationActivities: [])
        viewController.present(vc, animated: true)
    }
    
    func getPrefferedLocale() -> Locale {
        guard let prefferredIdentifier = Locale.preferredLanguages.first else {
            return Locale.current
        }
        return Locale(identifier: prefferredIdentifier)
    }
}
