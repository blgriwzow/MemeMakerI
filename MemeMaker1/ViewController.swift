//
//  ViewController.swift
//  MemeMaker1
//
//  Created by admin on 1/17/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: IB Outlets
    @IBOutlet weak var topSegementedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomSegementedControl: UISegmentedControl!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    
    //MARK: Choices arrays
    //Top label choices
    let topChoices = [
        CaptionOption(emoji: "🇺🇸", caption: "It ain't always patriotic"),
        CaptionOption(emoji: "🇬🇧", caption: "Beaut of a day, innit?"),
        CaptionOption(emoji: "🇮🇹", caption: "Io ho un serpente")
        
    ]
    
    //Bottom label choices
    let bottomChoices = [
        CaptionOption(emoji: "🇺🇸", caption: "but when it is, it ain't"),
        CaptionOption(emoji: "🇬🇧", caption: "cor"),
        CaptionOption(emoji: "🇮🇹", caption: "nello stivale")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        topSegementedControl.removeAllSegments()
        for choice in topChoices {
            topSegementedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topSegementedControl.selectedSegmentIndex = 0
        
        bottomSegementedControl.removeAllSegments()
        for choice in bottomChoices{
            bottomSegementedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomSegementedControl.selectedSegmentIndex = 0
        
        updateCaptions()
    }
    
    func updateCaptions() {
        //top captions
        let topIndex = topSegementedControl.selectedSegmentIndex
        topCaptionLabel.text = topChoices[topIndex].caption
        
        //bottom captions
        let bottomIndex = bottomSegementedControl.selectedSegmentIndex
        bottomCaptionLabel.text = bottomChoices[bottomIndex].caption
    }

    //MARK: IB Actions
    @IBAction func segemntedControlChange(_ sender: Any) {
        updateCaptions()
    }
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed{
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
    
}

