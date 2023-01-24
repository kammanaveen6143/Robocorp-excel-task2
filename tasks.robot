*** Settings ***
Documentation       Template robot main suite.

Library             RPA.Tables
Library             OperatingSystem
Library             pdf.py


*** Variables ***
${Csv_path}     =    learnerActivityReportData.csv


*** Tasks ***
Minimal task
    ${table}=    Reading input data from csv
    filtering on attempt1 based    ${table} 1

    filtering on attempt2 based

    filtering on attempt3 based

    filtering based on percentage 0 to 25%

    filtering based on percentage 25 to 50%

    filtering based on percentage 50 to 75%

    filtering based on percentage 75 to 100%


*** Keywords ***
Reading input data from csv
    ${input}=    Read table from CSV    learnerActivityReportData.csv    encoding='utf8
    RETURN    ${input}

filtering on attempt1 based
    [Arguments]    ${input}

    Filter Table By Column    ${input}    ASSESSMENT ATTEMPTS    ==    1
    ${count1}=    Get Length    ${input}
    log    ${count1}

filtering on attempt2 based
    ${input}=    Read table from CSV    learnerActivityReportData.csv    encoding='utf8
    ${count1}=    Get Length    ${input}
    log    ${count1}
    Filter Table By Column    ${input}    ASSESSMENT ATTEMPTS    ==    2
    ${count1}=    Get Length    ${input}
    log    ${count1}

filtering on attempt3 based
    ${input}=    Read table from CSV    learnerActivityReportData.csv    encoding='utf8
    ${count1}=    Get Length    ${input}
    log    ${count1}
    Filter Table By Column    ${input}    ASSESSMENT ATTEMPTS    ==    3
    ${count1}=    Get Length    ${input}
    log    ${count1}

filtering based on percentage 0 to 25%
    ${input}=    Read table from CSV    learnerActivityReportData.csv    encoding='utf8
    Filter Table By Column    ${input}    FIRST SCORE    >=    0
    Filter Table By Column    ${input}    FIRST SCORE    <=    25
    Filter Table By Column    ${input}    FIRST SCORE    !=    100
    Filter Table By Column    ${input}    LAST SCORE    >=    0
    Filter Table By Column    ${input}    LAST SCORE    <=    25
    Filter Table By Column    ${input}    LAST SCORE    !=    100
    ${count1}=    Get Length    ${input}
    log    ${count1}

filtering based on percentage 25 to 50%
    ${input}=    Read table from CSV    learnerActivityReportData.csv    encoding='utf8

    Filter Table By Column    ${input}    FIRST SCORE    >=    26
    Filter Table By Column    ${input}    FIRST SCORE    <=    50
    Filter Table By Column    ${input}    FIRST SCORE    !=    100
    Filter Table By Column    ${input}    LAST SCORE    >=    26
    Filter Table By Column    ${input}    LAST SCORE    <=    50
    Filter Table By Column    ${input}    LAST SCORE    !=    100
    ${count1}=    Get Length    ${input}
    log    ${count1}

filtering based on percentage 50 to 75%
    ${input}=    Read table from CSV    learnerActivityReportData.csv    encoding='utf8

    Filter Table By Column    ${input}    FIRST SCORE    >=    51
    Filter Table By Column    ${input}    FIRST SCORE    <=    75
    Filter Table By Column    ${input}    FIRST SCORE    !=    100
    Filter Table By Column    ${input}    LAST SCORE    >=    51
    Filter Table By Column    ${input}    LAST SCORE    <=    75
    Filter Table By Column    ${input}    LAST SCORE    !=    100
    ${count1}=    Get Length    ${input}
    log    ${count1}

filtering based on percentage 75 to 100%
    ${input}=    Read table from CSV    learnerActivityReportData.csv    encoding='utf8

    Filter Table By Column    ${input}    FIRST SCORE    >=    76
    Filter Table By Column    ${input}    FIRST SCORE    <=    100
    Filter Table By Column    ${input}    LAST SCORE    >=    76
    Filter Table By Column    ${input}    LAST SCORE    <=    100
    ${count1}=    Get Length    ${input}
    log    ${count1}
