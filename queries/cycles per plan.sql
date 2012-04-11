/*
This will list caTissue "test plans" and the "test cycles" in which those plans were run or
scheduled
*/
SELECT
    distinct
    TP_Name,
    TP_Desc,
    testcycle_id,
    testcycle_desc
FROM
    catissue_plan p,
    testplan tp,
    testresult tr,
    testcycle_info tc
where tp.tp_id = p.identifier
    and tr.tpr_id = tp.identifier
    and testcycle_id = tc.identifier