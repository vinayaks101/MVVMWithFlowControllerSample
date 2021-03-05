//
//  ViewControllerOne.swift
//  
//
//  Created by AnilP on 27/12/17.
//

import UIKit

protocol ViewControllerOneProtocol: class {
    /// On completion of Scene One
    func viewControllerOneFinished()
    
    // Add Custom callback functions here based on the Scene One app logic.
}

/**
 This class represents the **'View'** of the MVVM module. _It should only be used of updating the UI and binding with ViewModel for notifying user interactions._ */
class ViewControllerOne: UIViewController {
    
    weak var delegate: ViewControllerOneProtocol?
    private var viewModel: ViewModelOne?
    
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
        viewModel = ViewModelOne()
        // Do additional setup of viewModel
    }
    
    private func setUpButton() {
        let button = UIButton(frame: CGRect(x: view.center.x - 50, y: view.center.y, width: 100, height: 50))
        button.backgroundColor = .black
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(btnNextAction), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc private func btnNextAction() {
        delegate?.viewControllerOneFinished()
    }
}

