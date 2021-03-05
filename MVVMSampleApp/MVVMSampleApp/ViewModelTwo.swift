//
//  ViewModelTwo.swift
//  MVVMSampleApp
//
//  Created by Vinayak on 12/28/17.
//  Copyright © 2017 Vinayak. All rights reserved.
//

import Foundation

/**
 ViewModel for SceneTwo module.
 
 Represents ‘state’ of view. Independent of UIKit. */
class ViewModelTwo {
    
    // Owns the model for the Scene Two.
    private var model: ModelTwo?
    
    /// Initialises ViewModelTwo
    init() {
        model = ModelTwo()
        // Do additional setup for the ViewModel
    }
}
