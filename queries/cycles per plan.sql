/*
This will list caTissue "master test plans" and the "test cycles" in which those plans were run or
scheduled
*/
SELECT
    distinct
    master_Name,
    testcycle_id,
    testcycle_desc
FROM
    testplan_new p,
    testplan tp,
    testresult tr,
    testcycle_info tc
where tp.tp_id = p.identifier
    and tr.tpr_id = tp.identifier
    and testcycle_id = tc.identifier