//
//  ViewModelOne.swift
//  MVVMSampleApp
//
//  Created by Vinayak on 12/28/17.
//  Copyright © 2017 Vinayak. All rights reserved.
//

import Foundation

/**
 ViewModel for SceneOne module.

 Represents ‘state’ of view. Independent of UIKit. */
class ViewModelOne {
    
    // Owns the model for the Scene One.
    private var model: ModelOne?
    
    
    /// Initialises ViewModelOne
    init() {
        model = ModelOne()
        // Do additional setup for the ViewModel
    }
}
