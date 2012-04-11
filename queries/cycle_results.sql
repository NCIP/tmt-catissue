/*
This lists entries from the testresult table showing result status and 
plan and cycle information.
Note that the testresult table contains rows that represent tests 
that have been scheduled but not yet run.
These tests are scheduled when a test set is created.
A calculated column is added to create a single column identifier which represents
the test set.
*/
SELECT tcycle.identifier testcycle, tcycle.testcycle_desc, tcycle.testcycle_start_date, tcycle.testcycle_end_date,
    tc.identifier testcaseid,tc.tc_id,tc.tc_title, 
    tc.tc_details ,
    result.execution_date ,
    result.result ,
    tpinfo.tp_name,
    concat(tpinfo.identifier,'_',tcycle.identifier) test_set
FROM 
    testresult result ,
    testplan tp,
    testcase_info tc,
    testcycle_info tcycle,
    catissue_plan tpinfo
where

    result.testcycle_id=tcycle.identifier 
and
    result.auto_id=tc.identifier
and 
    result.tpr_id=tp.identifier
and
    tp.tp_id=tpinfo.identifier



