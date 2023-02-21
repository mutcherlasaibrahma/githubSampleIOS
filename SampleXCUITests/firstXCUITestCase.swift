//
//  firstXCUITestCase.swift
//  SampleXCUITests
//
//  Created by saibrahma.mutcherla on 03/02/23.
//  Copyright © 2023 BrowserStack. All rights reserved.
//

import Foundation
import XCTest

class firstXCUITestCase: XCTestCase {
    
    let app = XCUIApplication()
    
    func testLaunchAndTerminate() throws {
        
        print("-----APP LAUNCHED----")
        app.launch()
        print("------APP TERMINATED")
        app.terminate()
        
    }
    
    func testRecordAndPlay() throws {
        
        
        let app = XCUIApplication()
        app.launch()
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Web View"].tap()
        tabBar.buttons["UI Elements"].tap()
        app.buttons["Alert"].tap()
        app.alerts["Alert"].scrollViews.otherElements.buttons["OK"].tap()
        
    }
    
    func testVerifyingTabAndText() throws{
        let app = XCUIApplication()
        app.launch()
        print("----APP LAUNCHED----")
        
        //tab on the alert button
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
        
        
        //tab on text
        let tabText = app.staticTexts["Text"]
        _=tabText.waitForExistence(timeout: 5)
        //tab on the text
        tabText.tap()
        print("TEXT TAPPED")
        
        let tabTextField = app
            .textFields["Enter a text"]
        _=tabTextField.waitForExistence(timeout: 5)
        
        //tab on the text field
        tabTextField.tap()
        print("TEXT FIELD TAPPED")
        
        //Enter a text on the text field
        tabTextField.typeText("WELCOME TO CHOWNOW")
        
        //Clicking on Back Btn from UI
        let btnBack = app.navigationBars["Sample_iOS.TextEditor"].buttons["UI Elements"]
        _=btnBack.waitForExistence(timeout: 5)
        
        //tapping on back btn
        btnBack.tap();
        
        
    }
    
    func testVerifyTabOnFirstElement() throws {
        // launching the app
        app.launch();
        print("--APP LAUNCHED----")
        
        //Tapping on Webview
        app.buttons["Web View"].tap();
        print("--TAPPED ON WEBVIEW")
        sleep(5)
        
        //Tapping on Conitune Button on First Match
        
        app.buttons["Get a demo"].firstMatch.tap()
        sleep(5)
        app.terminate()
        
        
    }
    
    func testVerifySwipesElements() throws {
        
        app.launch();
        print("APP LAUNCHED SUCCESSFULLY")
        
        app.buttons["Web View"].tap()
        
        print("TAPPED ON WEB VIEW")
        
        //Swiping the Screen
        
        app.swipeUp();
        print("SWIPED UP IS DONE")
        sleep(5)
        
        app.swipeDown();
        print("SWIPED DOWN IS DONE")
        
        app.swipeLeft()
        print("SWIPEED LEFT IS DONE")
        
        app.swipeRight()
        print("SWIPEED RIGHT IS DONE")
        
    }
    
    func testAssertions() throws {
        
        app.launch();
        print("---APP LAUCHED")
        
        //Verifing the asserts of Page
        let appLoadedUIElements = app.staticTexts["UI Elements"]
        XCTAssertTrue(appLoadedUIElements.exists)
        
        //Verifing the Text is displayed on app loaded page
        let textVisisble = app.staticTexts["Text"]
        XCTAssertTrue(textVisisble.exists)
        
        //Verifying Alert Button is Displayed on app loaded page
        let alertBtnVisibsle = app.staticTexts["Alert"]
        XCTAssertTrue(alertBtnVisibsle.exists)
        
        //Verifing WebView Button is Displayed on app loaded page
        let webViewBtnDisplayed = app.buttons["Web View"]
        XCTAssertTrue(webViewBtnDisplayed.exists)
        
        //Verifying Local Testing Button is Disolayed in app loaded page
        let localTestingBtnDisplayed = app.buttons["Local Testing"]
        XCTAssertTrue(localTestingBtnDisplayed.exists)
        
        //Verifying tabping on Alert Btn
        app.buttons["Alert"].tap();
        let alertMessageisDisplayed = app.staticTexts["This is a native alert."]
        XCTAssertTrue(alertBtnVisibsle.exists)
    }
    
    func testBrowerStackUIElementsApp() {
        testLaunchApp();
        testClickOnAlertAndVerifyTextInAlertBox();
        testClickOkButtonInAlert();
        testTabOnTextField();
        testEnterSampleTextInTextField();
        testVerifyNavigateBackToHomePageBtn();
        testKillTheApp();
        
    }
    
    func testConditionsAlertBox() throws {
        app.launch()
        print("APP LAUNCHED")
        
        let alertBtnVisibsle = app.staticTexts["Alert"]
        if alertBtnVisibsle.exists{
            print("---ALERT BTN IS VISIBLE----")
            alertBtnVisibsle.tap();
            let alertMessageisDisplayed = app.staticTexts["This is a native alert."]
            if alertMessageisDisplayed.exists{
                print("----ALERT MESSAGE IS VISIBLE----")
                let buttonOK = app.buttons["OK"]
                if buttonOK.exists{
                    print("---OK BUTTON IS DISPLAYED IN ALERT BOX")
                    buttonOK.tap()
                }else{
                    print("---OK BUTTON IS NOT DISPLAYED")
                }
            }else{
                print("----ALERT MESSAGE IS NOT VISIBLE------")
            }
            
        }else{
            print("----ALTERT BTN IS NOT VISIBLE")
        }
        
    }
    
    func testPredicate() throws{
        app.launch()
        let alert = "Alert";
        waitMessage(message: alert)
    }

    func waitMessage(message: String) {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", message)
        let result = app.staticTexts.containing(predicate).firstMatch.tap()
        print("----ALERT TAPPED------")
    }

    
    func testValidateSwipeElemetsFunctions(){
        app.launch()
        print("-----APP LAUNCHED------")
        
        app.buttons["Web View"].firstMatch.tap()
        sleep(5)
        
        //Validating the app is scrolled to OLX Image
        let olxImage  = app.images["Olx"]
        while (olxImage.exists) {
            app.swipeUp();
            sleep(5)
            if olxImage.isHittable{
                print("OLX IMAGE IS FOUND")
                break
            }
        }
        
        
        //Validating app is scrolled to fotter for Terms of Service text
        let termsOfServiceTxt = app.staticTexts["Terms of Service"];
        sleep(5)
        while termsOfServiceTxt.exists {
            app.swipeUp();
            sleep(5)
            if termsOfServiceTxt.isHittable{
                print("TERMS OF SERIVES IS FOUND")
                break
            }
        }
        
        //Verifying app is scrolled and indentified the social elemets like "TWITTER"
        let verifySocialElemets = app.staticTexts["SOCIAL"]
        sleep(5)
        if verifySocialElemets.exists{
          let twitterImageFound =   app.images["BrowserStack Twitter Account An illustration of white twitter Logo"]
            if twitterImageFound.exists {
                print("TWITTER ELEMENT IS FOUND")
            }
        }else{
            print("TWITTER ELEMENT IS NOT FOUND")
        }
        
        
        //Verifying app is scroll to Top of the Page
        let topPage = app.staticTexts["App & Browser Testing Made Easy"];
        while topPage.exists {
            app.swipeDown();
            sleep(5)
            if topPage.isHittable{
                print("GET A DEMO TOP PAGE IS SCROLLED")
                break
            }
        }
        
        app.terminate()
        print("----APP TERMINATED----")
        
        
    }
}





extension firstXCUITestCase {
    
    func testLaunchApp() {
        print("-----APP LAUNCHED----")
        app.launch()
        //Verifing the asserts of Page
        let appLoadedUIElements = app.staticTexts["UI Elements"]
        XCTAssertTrue(appLoadedUIElements.exists)
    }
    
    func testClickOnAlertAndVerifyTextInAlertBox()  {
        //Verifying Alert Button is Displayed on app loaded page
        let alertBtnVisibsle = app.staticTexts["Alert"]
        XCTAssertTrue(alertBtnVisibsle.exists)
        
        let tabAlert = app.staticTexts["Alert"]
        _=tabAlert.waitForExistence(timeout: 5)
        //waiting for this alert for 5 seconds
        
        //Verifying tabping on Alert Btn
        app.buttons["Alert"].tap();
        print("ALERT TAPPED")
        let alertMessageisDisplayed = app.staticTexts["This is a native alert."]
        XCTAssertTrue(alertMessageisDisplayed.exists)
        
    }
    
    func testClickOkButtonInAlert() {
        let buttonOK = app.buttons["OK"]
        _=buttonOK.waitForExistence(timeout: 5)
        
        //tapping OK button Alert box
        buttonOK.tap()
        print("OK TAPPED")
    }
    
    func testTabOnTextField(){
        //tab on text
        let tabText = app.staticTexts["Text"]
        _=tabText.waitForExistence(timeout: 5)
        //tab on the text
        tabText.tap()
        print("TEXT TAPPED")
        
    }
    
    func testEnterSampleTextInTextField(){
        let tabTextField = app
            .textFields["Enter a text"]
        _=tabTextField.waitForExistence(timeout: 5)
        //Enter a text on the text field
        tabTextField.tap()
        tabTextField.typeText("WELCOME TO CHOWNOW")
    }
    
    func testVerifyNavigateBackToHomePageBtn(){
        //Clicking on Back Btn from UI
        let btnBack = app.navigationBars["Sample_iOS.TextEditor"].buttons["UI Elements"]
        _=btnBack.waitForExistence(timeout: 5)
        
        //tapping on back btn
        btnBack.tap();
        
        //Verifying Local Testing Button is Disolayed in app loaded page
        let localTestingBtnDisplayed = app.buttons["Local Testing"]
        XCTAssertTrue(localTestingBtnDisplayed.exists)
        
    }
    
    func testKillTheApp(){
        app.terminate()
        print("----APP TERMINATED----")
    }
    
}
