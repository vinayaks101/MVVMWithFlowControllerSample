//
//  ViewControllerTwo.swift
//  MVVMSampleApp
//
//  Created by Vinayak on 12/28/17.
//  Copyright © 2017 Vinayak. All rights reserved.
//

import UIKit

protocol ViewControllerTwoProtocol: class {
    
    /// On completion of Scene Two
    func viewControllerTwoFinished()
    
    // Add Custom callback functions here based on the Scene Two app logic.
}

/**
 This class represents the **'View'** of the MVVM module. _It should only be used of updating the UI and binding with ViewModel for notifying user interactions._ */
class ViewControllerTwo: UIViewController {

    weak var delegate: ViewControllerTwoProtocol?
    private var viewModel: ViewModelTwo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
        setupViewModel()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupViewModel() {
        viewModel = ViewModelTwo()
        // Do additional setup of viewModel
    }
    
    private func setUpButton() {
        let button = UIButton(frame: CGRect(x: view.center.x - 50, y: view.center.y, width: 100, height: 50))
        button.backgroundColor = .black
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(btnBackAction), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc private func btnBackAction() {
        delegate?.viewControllerTwoFinished()
    }
}
