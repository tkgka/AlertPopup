//
//  popupController.swift
//  Switcher
//
//  Created by 김수환 on 2022/01/21.
//

import SwiftUI

public extension View {
//    @discardableResult
    func setWindow() -> NSWindow{
        let controller = NSHostingController(rootView: self)
        let win = NSWindow(contentViewController: controller)
        return win
    }

}

public func closeWindow(window:NSWindow){
    window.close()
}


public func displayAsAlert(win:NSWindow, Timer:Double){
    win.isMovableByWindowBackground = false
    win.titleVisibility = .hidden
    win.titlebarAppearsTransparent = true
    win.isOpaque = false
    win.styleMask.remove(.closable)
    win.styleMask.remove(.fullScreen)
    win.styleMask.remove(.miniaturizable)
    win.styleMask.remove(.fullSizeContentView)
    win.styleMask.remove(.resizable)
    win.backgroundColor = NSColor.clear
    win.orderFrontRegardless()
    DispatchQueue.main.asyncAfter(deadline: .now() + Timer) {
        closeWindow(window: win)
    }
}


public func ShowSystemAlert(ImageName:String, AlertText:String, Timer:Double) -> NSWindow{
    let AlertWindow= AlertView(ImageName: self.ImageName, AlertText: self.AlertText,Timer:self.Timer).setWindow()
    displayAsAlert(win: AlertWindow, Timer: Timer)
    return AlertWindow
}
