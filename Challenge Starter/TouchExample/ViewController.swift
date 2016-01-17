//
//  ViewController.swift
//  AutoLayout_Challenge6
//
//  Created by Brian Moakley on 1/22/15.
//  Copyright (c) 2015 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var rayWidth: NSLayoutConstraint!
  @IBOutlet weak var rayHeight: NSLayoutConstraint!
  @IBOutlet weak var ray: UIImageView!
  
  @IBOutlet weak var vickiWidth: NSLayoutConstraint!
  @IBOutlet weak var vickiHeight: NSLayoutConstraint!
  @IBOutlet weak var vicki: UIImageView!
  
  @IBOutlet weak var samWidth: NSLayoutConstraint!
  @IBOutlet weak var samHeight: NSLayoutConstraint!
  @IBOutlet weak var sam: UIImageView!
  
  @IBOutlet weak var micWidth: NSLayoutConstraint!
  @IBOutlet weak var micHeight: NSLayoutConstraint!
  @IBOutlet weak var mic: UIImageView!
  
  @IBOutlet weak var christineWidth: NSLayoutConstraint!
  @IBOutlet weak var christineHeight: NSLayoutConstraint!
  @IBOutlet weak var christine: UIImageView!
 
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var bio: UITextView!
  
  var heights:[NSLayoutConstraint]!
  var widths:[NSLayoutConstraint]!
  var bios: [String]!
  var names: [String]!
  

  @IBOutlet weak var emailButton: UIButton!
  var previousHeight: NSLayoutConstraint?
  var previousWidth: NSLayoutConstraint?
  
  override func viewWillAppear(animated: Bool) {

    bios = ["Ray is an indie software developer currently focusing on iPhone and iPad development, and the administrator of this site. He’s the founder of a small iPhone development studio called Razeware, and is passionate both about making apps and teaching others the techniques to make them.", "Vicki Wenderlich discovered a love of digital art in 2009, and has been making app art and digital illustrations ever since. She is passionate about helping people pursue their dreams, and makes free app art for developers available on her website, http://www.vickiwenderlich.com.", "Mic Pringle is a developer, editor, podcaster, and video tutorial maker. He's also Razeware's third full-time employee. When not knee-deep in Swift or stood in-front of his green screen, he enjoys spending time with his wife Lucy and their daughter Evie, as-well as attending the football matches of his beloved Fulham FC. You can find Mic on Twitter, GitHub, and Stack Overflow.", "Sam is a strange mashup of developer, writer and trainer. By day you'll find him recording videos for Razeware, writing tutorials, attending conferences and generally being a good guy. By night he's likely to be out entertaining people, armed with his trombone and killer dance moves.", "Christine is Ray's administrative assistant. She tries to keep order in the ever expanding world of raywenderlich.com so that Ray and the team can stay focused on making more tutorials, books, and apps!"]
    names = ["Ray Wenderlich", "Vicki Wenderlich", "Mic Pringle", "Sam Davies", "Christine Sweigart"]
    name.text = ""
    emailButton.hidden = true
  
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //var razeware = [ray, vicki, mic, sam, christine]
    heights = [rayHeight, vickiHeight, micHeight, samHeight, christineHeight]
    widths = [rayWidth, vickiWidth, micWidth, samHeight, christineWidth]

  }

  func tappedImage(sender:UITapGestureRecognizer!) {
    
    var tag = 0
    if let senderTag = sender.view?.tag {
      tag = senderTag
    }
  
    let width = widths[tag]
    let height = heights[tag]
    
    if previousHeight == height {
      if previousHeight?.constant == 100 {

        self.previousHeight?.constant = 50
        self.previousWidth?.constant = 50
        view.updateConstraints()
        UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.view.layoutIfNeeded()
        })
        
        name.text = ""
        bio.text = ""
        emailButton.hidden = true
      } else {
        self.previousHeight?.constant = 100
        self.previousWidth?.constant = 100
        view.updateConstraints()
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
        name.text = names[tag]
        bio.text = bios[tag]
        bio.font = UIFont.systemFontOfSize(15.0)
        bio.textColor = UIColor.whiteColor()
        emailButton.hidden = false
      }
    } else {
        self.previousHeight?.constant = 50
        self.previousWidth?.constant = 50
        width.constant = 100
        height.constant = 100
        view.updateConstraints()
        UIView.animateWithDuration(1.0, animations: { () -> Void in

            self.view.layoutIfNeeded()
        })
        
      name.text = names[tag]
      bio.text = bios[tag]
      bio.font = UIFont.systemFontOfSize(15.0)
      bio.textColor = UIColor.whiteColor()
      emailButton.hidden = false
      
    }
    
    previousHeight = height
    previousWidth = width
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

