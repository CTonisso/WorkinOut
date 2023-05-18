//
//  TabBarCoordinator.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import UIKit

class TabBarCoordinator : Coordinator {
    
    override internal func start() {
        print("Tabbar Coordinator Init")
        initializeHomeTabBar()
    }
    
    deinit {
        print("Tabbar Coordinator Deinit")
    }
    
    func initializeHomeTabBar(){
        let tabBarController = UITabBarController()
        tabBarController.tabBar.barStyle = .default
        tabBarController.tabBar.barTintColor = .black
        tabBarController.tabBar.backgroundColor = .black
        tabBarController.tabBar.unselectedItemTintColor = .gray
        tabBarController.tabBar.tintColor = .highlightYellow
        
        let workoutsNavigationController = UINavigationController()
        let workoutsCoordinator = WorkoutsCoordinator(workoutsNavigationController)
        workoutsCoordinator.parentCoordinator = parentCoordinator
        
        let workoutsItem = UITabBarItem()
        workoutsItem.image = UIImage(named: "TodoList")!
            .withRenderingMode(.alwaysTemplate)
        workoutsItem.title = "Workouts"
        workoutsNavigationController.tabBarItem = workoutsItem
        
        let exerciseNavigationController = UINavigationController()
        let exerciseCoordinator = ExerciseCoordinator(exerciseNavigationController)
        exerciseCoordinator.parentCoordinator = parentCoordinator
        
        let exerciseItem = UITabBarItem()
        exerciseItem.image = UIImage(named: "DumbBell")!
            .withRenderingMode(.alwaysTemplate)
        exerciseItem.title = "Exercícios"
        exerciseNavigationController.tabBarItem = exerciseItem
        
        tabBarController.viewControllers = [workoutsNavigationController, exerciseNavigationController]
        navigationController.pushViewController(tabBarController, animated: true)
        navigationController.setNavigationBarHidden(true, animated: true)
        
        parentCoordinator?.children.append(workoutsCoordinator)
        parentCoordinator?.children.append(exerciseCoordinator)
        
        workoutsCoordinator.start()
        exerciseCoordinator.start()
    }
    
}
