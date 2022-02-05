//
//  AppDelegate.swift
//  AlertPopup
//
//  Created by tkgka on 01/29/2022.
//  Copyright (c) 2022 tkgka. All rights reserved.
//

import Cocoa
import SwiftUI
import AlertPopup
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application
      if #available(macOS 10.15, *) {
          DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
              ShowSystemAlert(ImageName:"exclamationmark.circle" , AlertText: "hello", Timer: 5, ImageColor: Color.red, FontColor: Color.blue)
          }
      } else {
          // Fallback on earlier versions
      }
      
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }


}

