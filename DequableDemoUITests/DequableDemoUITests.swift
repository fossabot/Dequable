import XCTest

class DequableDemoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMe() {
      let tablesQuery = XCUIApplication().tables
      tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Row 6"]/*[[".cells.staticTexts[\"Row 6\"]",".staticTexts[\"Row 6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
      tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Row 8"]/*[[".cells.staticTexts[\"Row 8\"]",".staticTexts[\"Row 8\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
      tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Row 12"]/*[[".cells.staticTexts[\"Row 12\"]",".staticTexts[\"Row 12\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
      XCTAssert(tablesQuery.staticTexts["Row 13"].exists)
    }
    
}
