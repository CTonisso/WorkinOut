//
//  NavBarUtils.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import UIKit

final class NavBarUtils {
    
    public static func configureNavigationBar(for navigationController: UINavigationController) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .darkGray
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.highlightYellow]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.highlightYellow]
        navigationController.navigationBar.tintColor = .highlightYellow
        navigationController.navigationBar.backgroundColor = .darkGray
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.isHidden = false
        navigationController.navigationBar.prefersLargeTitles = true
    }

}
