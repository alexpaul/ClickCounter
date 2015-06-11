//
//  ViewController.swift
//  Click Counter
//
//  Created by Alex Paul on 6/10/15.
//  Copyright (c) 2015 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Creating UI elements in code 
    
    // Declare a UILabel
    var counterLabel: UILabel!
    
    // Declare a UIButton for Incrementing
    var incrementButton: UIButton!
    
    // Button for decrementing 
    var decrementButton: UIButton!
    
    // Button to change the view's background color
    var backgroundColorButton: UIButton!
    
    // Counter 
    var counter = 0
    
    // Array of UIColors 
    let colors = [UIColor.grayColor(), UIColor.greenColor(), UIColor.yellowColor(),
                    UIColor.lightGrayColor(), UIColor.orangeColor(), UIColor.brownColor()]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Size Constants 
        let minHeight: CGFloat = 44
        let inset: CGFloat = 10
        
        // Create and add properties to the label
        let labelWidth: CGFloat = 200
        let labelHeight: CGFloat = minHeight
        let labelXCoordinate: CGFloat = (self.view.center.x) - labelWidth/2
        
        counterLabel = UILabel(frame: CGRectMake(labelXCoordinate, self.view.bounds.height/3, labelWidth, labelHeight))
        counterLabel.text = "0"
        counterLabel.textAlignment = NSTextAlignment.Center
        
        // Add the counter label to the view's subview
        self.view.addSubview(counterLabel)
        
        // Create and add properties to the increment button
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 44
        let buttonXCoordinate = inset
        
        incrementButton = UIButton(frame: CGRectMake(buttonXCoordinate, counterLabel.frame.origin.y + minHeight, buttonWidth, buttonHeight))
        incrementButton.setTitle("Increment", forState: UIControlState.Normal)
        incrementButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        
        // Respond when the user presses "Click" button
        incrementButton.addTarget(self, action: "operationButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

        // Add the increment button to the view's subview
        self.view.addSubview(incrementButton)
        
        // Create and add the properties for the decrement button 
        decrementButton = UIButton(frame: CGRectMake((self.view.bounds.width) - (inset + buttonWidth), counterLabel.frame.origin.y + minHeight, buttonWidth, buttonHeight))
        decrementButton.setTitle("Decrement", forState: UIControlState.Normal)
        decrementButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        
        // Add decrement action to the decrement button 
        decrementButton.addTarget(self, action: "operationButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        // Add the decrement button to the view's subview
        self.view.addSubview(decrementButton)
        
        // Create and add the properties for the background color button 
        var backgroundColorButtonWidth: CGFloat = buttonWidth * 2
        
        backgroundColorButton = UIButton(frame: CGRectMake(self.view.center.x - (backgroundColorButtonWidth / 2), (counterLabel.frame.origin.y) + (minHeight * 2), backgroundColorButtonWidth, buttonHeight))
        backgroundColorButton.setTitle("Background Color", forState: UIControlState.Normal)
        backgroundColorButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        backgroundColorButton.addTarget(self, action: "toggleBackgroundColor", forControlEvents: UIControlEvents.TouchUpInside)
        
        // Add the background color button to the view's subview
        self.view.addSubview(backgroundColorButton)
    }
    
    // MARK: Helper Methods
    
    func operationButtonPressed(sender: UIButton) {
        if let buttonTitle = sender.titleLabel?.text {
            performOperation(buttonTitle)
        }
    }
    
    func toggleBackgroundColor() {
        
        // Randomly generate a number using the color array count
        var randomNumber = Int(arc4random_uniform(UInt32(colors.count)))
        
        // Uses a random index to toggle the view's background color
        self.view.backgroundColor = colors[randomNumber]
    }
    
    func performOperation(buttonTitle: String) {
        if buttonTitle == "Increment" {
            // Increment the counter by 1
            counter++
        }else if buttonTitle == "Decrement" {
            // Decrement the counter by 1
            counter--
        }
        // Update the Label's text
        counterLabel.text = "\(counter)"

    }

}

