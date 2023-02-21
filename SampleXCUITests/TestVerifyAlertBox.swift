//
//  testVerifyAlertBox.swift
//  SampleXCUITests
//
//  Created by saibrahma.mutcherla on 20/02/23.
//  Copyright © 2023 BrowserStack. All rights reserved.
//

import Foundation
import XCTest

class TestVerifyAlertBox: XCTestCase {
    
    let app = XCUIApplication()
    
    func testVerifyingAlertBox() throws{
        let app = XCUIApplication()
        app.launch()
        print("----APP LAUNCHED----")
        
        //tab on the alert buttons
        let tabAlert = app.staticTexts["Alert"]
        
        _=tabAlert.waitForExistence(timeout: 5)
        //waiting for this alert for 5 seconds
        
        //tapping the alert
        tabAlert.tap();
        print("ALERT TAPPED")
        
        let buttonOK = app.buttons["OK"]
        _=buttonOK.waitForExistence(timeout: 5)
        
        //tapping OK button Alert box
        buttonOK.tap()
        print("OK TAPPED")
    }
    
}
