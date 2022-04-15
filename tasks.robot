*** Settings ***
Documentation     Template robot main suite.
Library           RPA.Dialogs
Library           String
#Library          RPA.Browser
Library           RPA.Desktop    WITH NAME    dt
Library           RPA.Browser.Selenium    WITH NAME    sl

*** Variables ***
${project_name}
${error_message}

*** Keywords ***
Initial Question
    Add heading    Search or Create
    Add submit buttons    Search,Create
    ${result}=    Run dialog
    IF    $result.submit == "Create"
        Create Project
    END

*** Keywords ***
Create Project
    IF    "${error_message}" == ""
        Add heading    Create Project
    ELSE
        Add heading    ${error_message}
        Add icon    Warning    size=64
    END
    Add text input    Project    label=Project Name
    ${result}=    Run dialog
    ${checks}=    Fetch From Left    ${result.Project}    ${SPACE}
    Set Global Variable    ${error_message}    ${None}
    IF    "${result.Project}" != "${checks}"
        Set Global Variable    ${error_message}    A project name cannot have spaces, please correct and submit
        Create Project
    END

*** Keywords ***
Btest
    Open Chrome Browser    https://sa.www4.irs.gov/modiein/individual/index.jsp
    Sleep    1
    dt.Press Keys    ESC
    Sleep    1
    Click Element    xpath://input[@name='submit']
    Sleep    1
    click element    xpath://input[@id='sole']
    Sleep    1
    Click element    xpath://div[@id='individual-leftcontent']/form/div[16]/input
    Sleep    1
    click element    xpath://input[@id='sole']
    sleep    1
    Click Element    xpath:(//input[@name='Submit'])[2]
    sleep    1
    Click Element    xpath://div[@id='individual-leftcontent']/form/div[2]/input
    sleep    1
    Click Element    xpath://label[contains(.,'Started a new business')]/../input
    sleep    1
    click element    xpath://div[@id='individual-leftcontent']/form/div[11]/input
    sleep    1
    Input Text    xpath://input[@id='applicantFirstName']    Colby
    Input Text    xpath://div[@id='individual-leftcontent']/form/div[2]/table/tbody/tr[3]/td[2]/input    Worthington
    Input Text    xpath://input[@id='applicantSSN3']    123
    Input Text    xpath://input[@id='applicantSSN2']    62
    Input Text    xpath://input[@id='applicantSSN4']    7283
    Click Element    xpath://input[@id='iamsole']
    Click Element    xpath://input[@name='Submit2']
    sleep    1
    Click Element    xpath://input[@name='Submit2']

*** Keywords ***
Atest
    Open User Browser    https://sa.www4.irs.gov/modiein/individual/index.jsp
    sleep    2
    dt.Press Keys    esc
    dt.Click    alias:B2
    sleep    1
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    space
    dt.click    alias:Continue
    sleep    1
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    space
    dt.click    alias:Continue
    sleep    1
    dt.click    alias:Continue
    sleep    1
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    space
    dt.click    alias:Continue
    sleep    1
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Type Text    Eric
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Type Text    Hanson
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Press Keys    TAB
    dt.Type Text    111111111
    dt.Press Keys    TAB
    dt.Press Keys    space
    dt.click    alias:Continue

*** Keywords ***
Ctest
    #sl.Open Browser    www.yahoo.com    #browser=Chrome    #options=--disable-blink-features=AutomationControlled
    sl.Open Browser    url=https://sa.www4.irs.gov/modiein/individual/index.jsp    browser=chrome    options=add_argument('--user-data-dir/Users/eric/Library/Application Support/Google/Chrome/Guest Profile');add_argument('--disable-blink-features=AutomationControlled')    #add_argument('--disable-blink-features');add_argument('--disable-blink-features=AutomationControlled');add_argument("--start-maximized")
    Sleep    1
    dt.Press Keys    ESC
    Sleep    1
    Click Element    xpath://input[@name='submit']
    Sleep    1
    click element    xpath://input[@id='sole']
    Sleep    1
    Click element    xpath://div[@id='individual-leftcontent']/form/div[16]/input
    Sleep    1
    click element    xpath://input[@id='sole']
    sleep    1
    Click Element    xpath:(//input[@name='Submit'])[2]
    sleep    1
    Click Element    xpath://div[@id='individual-leftcontent']/form/div[2]/input
    sleep    1
    Click Element    xpath://label[contains(.,'Started a new business')]/../input
    sleep    1
    click element    xpath://div[@id='individual-leftcontent']/form/div[11]/input
    sleep    1
    Input Text    xpath://input[@id='applicantFirstName']    Colby
    Input Text    xpath://div[@id='individual-leftcontent']/form/div[2]/table/tbody/tr[3]/td[2]/input    Worthington
    Input Text    xpath://input[@id='applicantSSN3']    123
    Input Text    xpath://input[@id='applicantSSN2']    62
    Input Text    xpath://input[@id='applicantSSN4']    7283
    Click Element    xpath://input[@id='iamsole']
    sleep    1
    Click Element    xpath://input[@name='Submit2']
    sleep    1
    #Click Element    xpath://input[@name='Submit2']
    Screenshot

*** Keywords ***
dTest
    #${myDic}=    Create Dictionary    "disable-popup-blocking"    "enable-automation")
    #${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    #Call Method    ${chrome options}    add_experimental_option    excludeSwitches    ${myDic}
    #Create Webdriver    Chrome    chrome_options=${chrome options}
    #Goto    https://sa.www4.irs.gov/modiein/individual/index.jsp
    Open Browser    url=https://sa.www4.irs.gov/modiein/individual/index.jsp    browser=chrome    desired_capabilities="browser_version":"80.0"    options=add_argument('--disable-blink-features=AutomationControlled')
    ${myDic}=    create dictionary    {'disable-popup-blocking',    'enable-automation'}
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    new    ${chrome options}    add_experimental_option    excludeSwitches    "Arrays_asList('disable-popup-blocking', 'enable-automation')"
    Create Webdriver    Chrome    chrome_options=${chrome options}
    #Create Webdriver    driver_name=Chrome    alias={selenium.webdriver.chrome.options(setExperimentalOption("excludeSwitches",Arrays.asList("disable-popup-blocking","enable-automation")))}
    Goto    https://sa.www4.irs.gov/modiein/individual/index.jsp
    Sleep    1
    dt.Press Keys    ESC
    Sleep    1
    Click Element    xpath://input[@name='submit']
    Sleep    1
    click element    xpath://input[@id='sole']
    Sleep    1
    Click element    xpath://div[@id='individual-leftcontent']/form/div[16]/input
    Sleep    1
    click element    xpath://input[@id='sole']
    sleep    1
    Click Element    xpath:(//input[@name='Submit'])[2]
    sleep    1
    Click Element    xpath://div[@id='individual-leftcontent']/form/div[2]/input
    sleep    1
    Click Element    xpath://label[contains(.,'Started a new business')]/../input
    sleep    1
    click element    xpath://div[@id='individual-leftcontent']/form/div[11]/input
    sleep    1
    Input Text    xpath://input[@id='applicantFirstName']    Colby
    Input Text    xpath://div[@id='individual-leftcontent']/form/div[2]/table/tbody/tr[3]/td[2]/input    Worthington
    Input Text    xpath://input[@id='applicantSSN3']    123
    Input Text    xpath://input[@id='applicantSSN2']    62
    Input Text    xpath://input[@id='applicantSSN4']    7283
    Click Element    xpath://input[@id='iamsole']
    sleep    1
    Click Element    xpath://input[@name='Submit2']
    sleep    1
    #Click Element    xpath://input[@name='Submit2']
    Screenshot

*** Tasks ***
Minimal task
    #Do TK
    #Initial Question
    dtest
    Log    Done.
