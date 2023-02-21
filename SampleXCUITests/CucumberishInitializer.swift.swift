//
//  CucumberishInitializer.swift
//  WeatherCucumberUITests
//
//  Created by Kenneth Poon on 5/3/18.
//  Copyright © 2018 Kenneth Poon. All rights reserved.
//

import XCTest
import Foundation
import Cucumberish

class CucumberishInitializer: NSObject {
    @objc class func setupCucumberish(){
        before({ _ in
            XCUIApplication().launch()
        })
        
        Given("I am at UI Elements Form Page"){
            (args,userinfo) -> Void in self.waitForElementToAppear(XCUIApplication().otherElements["UI Elements"])
        }
        
        When("When I tap on ""Alert" button") { (args, userInfo) -> Void in
             let alertbtn = XCUIApplication().otherElements["Alert"]
             alertbtn.tap()
             }
             
             Then("Then I should see Alert box need to be appered on UI Elements Page Screen") { (args,   userInfo) -> Void in
            let text = XCUIApplication().staticTexts["Alert"]
            self.waitForElementToAppear(XCUIApplication().cells.staticTexts[text])
            
        }
             
             Then("Then I should to see  This is a native alert text in a Alert box") { (args,   userInfo) -> Void in
            let alertText = XCUIApplication().staticTexts["This is a native alert"]
            self.waitForElementToAppear(XCUIApplication().cells.staticTexts[alertText])
            
        }
             
             
             Then("Then I should to see Ok Button in a alert box") { (args,   userInfo) -> Void in
            let okBtn = XCUIApplication().buttons["Ok"]
            self.waitForElementToAppear(XCUIApplication().cells.staticTexts[okBtn])
            
        }
             
             Then("Then I tap on OK button") { (args,   userInfo) -> Void in
            let okBtn = XCUIApplication().buttons["Ok"]
            okBtn.tap()
            
        }
             
             
             let bundle = Bundle(for: CucumberishInitializer.self)
             Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: self.getTags(), excludeTags: nil)
             
             }
             
    class func waitForElementToAppear(_ element: XCUIElement){
            
            let result = element.waitForExistence(timeout: 5)
            guard result else {
                XCTFail("Element does not appear")
                return
            }
        }
             
    fileprivate class func getTags() -> [String]? {
            
            var itemsTags: [String]? = nil
            for i in ProcessInfo.processInfo.arguments {
                if i.hasPrefix("-Tags:") {
                    let newItems = i.replacingOccurrences(of: "-Tags:", with: "")
                    itemsTags = newItems.components(separatedBy: ",")
                }
            }
            return itemsTags
        }
             
    }
