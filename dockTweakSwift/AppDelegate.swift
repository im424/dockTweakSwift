//
//  AppDelegate.swift
//  dockTweakSwift
//
//  Created by To Kin Hang on 6/6/14.
//  Copyright (c) 2014 To Kin Hang. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
	@IBOutlet var window: NSWindow
	@IBOutlet var left : NSButton
	@IBOutlet var right : NSButton
	@IBOutlet var middle : NSButton

	
	@IBAction func buttonClick(sender : NSButton) {
		var task = NSTask()
		task.launchPath = "/usr/bin/defaults"
		
		var pos = "middle"
		if sender.tag == 0  {
			pos = "start"
		}else if sender.tag == 2 {
			pos = "end"
		}
		task.arguments = ["write", "com.apple.dock", "pinning" , "-string",pos ];
		task.launch()
		
		
		var killDock  = NSTask()
		killDock.launchPath = "/bin/bash"
		killDock.arguments = ["-c","/usr/bin/killall Dock"]
		killDock.launch()
		
	}
	
	
	func applicationDidFinishLaunching(aNotification: NSNotification?) {
		// Insert code here to initialize your application
	}

	func applicationWillTerminate(aNotification: NSNotification?) {
		// Insert code here to tear down your application
	}


}

