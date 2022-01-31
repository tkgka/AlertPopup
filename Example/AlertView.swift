//
//  ContentView.swift
//  CQ
//
//  Created by 김수환 on 2021/12/31.
//

import SwiftUI

public struct BlurView: NSViewRepresentable {
    public typealias NSViewType = NSVisualEffectView
    
    public func makeNSView(context: Context) -> NSVisualEffectView {
        let effectView = NSVisualEffectView()
        effectView.material = .hudWindow
        effectView.blendingMode = .withinWindow
        effectView.state = NSVisualEffectView.State.active
        
        return effectView
    }
    
    public func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        nsView.material = .hudWindow
        nsView.blendingMode = .withinWindow
    }
}


public struct AlertView: View {
    let ImageName:String!
    let AlertText:String!
    @State var scale: CGFloat = 1
    let Timer:Double!
    let AlertTimeout:Double = 1
    let width = NSScreen.main?.frame.width
    let height = NSScreen.main?.frame.height
    public var body: some View {
        VStack{
        ZStack{
            BlurView()
            VStack{
                Image(systemName: ImageName)
                    .resizable()
                    .frame(width: 70.0, height: 70.0)
                    .foregroundColor(Color.white)
                    .padding()
                Text(AlertText).multilineTextAlignment(.center)
                    .font(.system(size: 15))
                    .foregroundColor(Color.white)
            }
        }.frame(width: 200, height: 200)
                .cornerRadius(20)
                .position(x: width!/2, y: height! - 200*3/2.04)
                .opacity(scale)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + AlertTimeout) {
                    let baseAnimation = Animation.easeIn(duration: Timer - AlertTimeout)
                    let repeated = baseAnimation.repeatCount(1, autoreverses: false)
                    withAnimation(repeated) {
                        scale = 0.0
                    }
                    }
                }
        }.frame(width: width!, height:height!)
    }
    public init(ImageName:String, AlertText:String, Timer:Double){
        self.ImageName = ImageName
        self.AlertText = AlertText
        self.Timer = Timer
    }
}
