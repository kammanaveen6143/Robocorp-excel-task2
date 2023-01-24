*** Settings ***
Documentation       Template robot main suite.

Library             RPA.Tables
Library             OperatingSystem
Library             RPA.Excel.Files
Library             RPA.FileSystem
Library             RPA.Outlook.Application
Library             Dialogs
Library             RPA.Desktop.Windows
Library             RPA.Dialogs


*** Variables ***
${Csv_path}     =    learnerActivityReportData.csv
${attempt}=     1
${input1}=      1
${input2}=      25


*** Tasks ***
Excel operations task
    TRY
        ${table}=    Create Table
        ${input_table}=    Reading Data
        ${table_length}=    Get Length    ${input_table}
        IF    ${table_length} == 0
            Log    Exacel not found
        ELSE
            ${countatm}=    Fetch no of employees based on attempts    ${attempt}    ${input_table}    ${table}
            ${countavg}=    finding average of scores    ${input1}    ${input2}    ${input_table}
            saving output to text file    ${countatm}    ${countavg}
        END
    EXCEPT    message
        Log    unable process the flow
    END


*** Keywords ***
Fetch no of employees based on attempts
    [Arguments]    ${attempt}    ${input}    ${table}

    TRY
        Filter Table By Column    ${input}    ASSESSMENT ATTEMPTS    ==    ${attempt}
        Write table to CSV    ${input}    attempt.csv    encoding='utf8

        ${countatm}=    Get Length    ${input}
        ${dic}=    Create List    ${attempt}    ${countatm}
        #...    attempt=    ${attempt}
        #...    count=    ${countatm}
        Add Table Row    ${table}    ${dic}
        Log    ${table}
        Write table to CSV    ${table}    attempt.csv    encoding='utf8
        log    ${countatm}
        RETURN    ${countatm}
    EXCEPT    message
        Log    unable to procees the attempt based data
        RETURN    ${countatm}
    END

finding average of scores
    [Arguments]    ${input1}    ${input2}    ${input_table}

    TRY
        Filter Table By Column    ${input_table}    FIRST SCORE    >=    ${input1}

        Filter Table By Column    ${input_table}    FIRST SCORE    <=    ${input2}

        Filter Table By Column    ${input_table}    FIRST SCORE    !=    100

        Filter Table By Column    ${input_table}    LAST SCORE    >=    ${input1}

        Filter Table By Column    ${input_table}    LAST SCORE    <=    ${input2}

        Filter Table By Column    ${input_table}    LAST SCORE    !=    100

        Write table to CSV    ${input_table}    average.csv    encoding='utf8

        ${countavg}=    Get Length    ${input_table}

        log    ${countavg}
        RETURN    ${countavg}
    EXCEPT    message
        Log    message
        RETURN    ${countavg}
    END

Reading Data
    TRY
        ${input}=    Read table from CSV    learnerActivityReportData.csv    encoding='utf8

        RETURN    ${input}
    EXCEPT
        Log    Can not read the excel data
    END

saving output to text file
    [Arguments]    ${countatm}    ${countavg}

    Log    ${countatm}
    ${text}=    Create File
    ...    C:/Users/kamma.naveen/Documents/RoboCorp/Excel operations/Finalop.txt
    ...    overwrite=${True}
    Append To File
    ...    C:/Users/kamma.naveen/Documents/RoboCorp/Excel operations/Finalop.txt
    ...    total emp based on ${attempt} attempt are ${countatm}\n
    Append To File
    ...    C:/Users/kamma.naveen/Documents/RoboCorp/Excel operations/Finalop.txt
    ...    Employes based on ${input1} to ${input2} percentage based ${countavg}
    Filter Table By Column    table    column    operator    value
