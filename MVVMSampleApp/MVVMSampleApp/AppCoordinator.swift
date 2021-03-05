//
//  AppCoordinator.swift
//  MVVMSampleApp
//
//  Created by Vinayak on 12/28/17.
//  Copyright © 2017 Vinayak. All rights reserved.
//

import UIKit

/**
 AppCoordinator works as FlowController for the app. _It should be owned only by the AppDelegate._
 
 It configures and manages the M-V-VM units being presented and navigated to, based on the application logic.
 
 On the first launch AppCoordinator will configure & present the First Module of the app. Each Module can then notify the AppCoordinator when they reach a logical end of their lifecycle.
 
 It determines based on app’s business logic where to go next which also includes managing rootNavigationController.
 
 */
final class AppCoordinator {
    
    /// Private property of AppCoordinator to access the UINavigationController for the app. Each storyboard can have its own rootNavigationController.
    fileprivate var rootNavigationController: UINavigationController?
    
    /// Initialises AppCoordinator and presents the first module to the UINavigationController.
    init() {
        if let viewControllerOne = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController() {
            (viewControllerOne as! ViewControllerOne).delegate = self
            self.rootNavigationController = UINavigationController(rootViewController: viewControllerOne)
        }
    }
    
    /// Fetches the root viewcontroller of type UINavigationController, which is being used to manage the app navigation between modules.
    ///
    /// - Returns: root UINavigationController
    func getRootViewController() -> UINavigationController? {
        return rootNavigationController
    }
    
    fileprivate func sceneOneComplete() {
        // Do custom setup here on completion of Scene One Module.
        showSceneTwo()
    }
    
    fileprivate func sceneTwoComplete() {
        // Do custom setup here on completion of Scene Two Module.
        pop()
    }
    
    /// Presents the Scene Two by pushing viewControllerTwo on the rootNavigationController.
    func showSceneTwo() {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        if let viewControllerTwo = mainStoryboard.instantiateViewController(withIdentifier: "VCTwo") as? ViewControllerTwo {
            //Do custom configuration for Scene Two module here.
            viewControllerTwo.delegate = self
            push(viewController: viewControllerTwo)
        }
    }
    
    /// Presents the Scene One by pushing viewControllerOne on the rootNavigationController.
    func showSceneOne() {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        if let viewControllerOne = mainStoryboard.instantiateViewController(withIdentifier: "VCOne") as? ViewControllerOne {
            //Do custom configuration for Scene One module here.
            viewControllerOne.delegate = self
            push(viewController: viewControllerOne)
        }
    }
    
    /// Pushes the viewController on the root UINavigationController.
    ///
    /// - Parameter viewController: viewController instance to be presented.
    private func push(viewController: UIViewController?) {
        guard let vc = viewController else { return }
        rootNavigationController?.pushViewController(vc, animated: true)
    }
    
    /// Pops the present ViewController from the rootNavigationController.
    private func pop() {
        rootNavigationController?.popViewController(animated: true)
    }
}

extension AppCoordinator: ViewControllerOneProtocol {
    // Add Custom callback functions here based on the Scene One app logic.
    
    /// On completion of Scene One
    func viewControllerOneFinished() {
        sceneOneComplete()
    }
}

extension AppCoordinator: ViewControllerTwoProtocol{
    // Add Custom callback functions here based on the Scene One app logic.
    
    /// On completion of Scene Two
    func viewControllerTwoFinished() {
        sceneTwoComplete()
    }
}
