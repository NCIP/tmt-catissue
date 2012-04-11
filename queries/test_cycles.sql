/*
This will list any "test cycle" in which a script was run or
scheduled as part of a caTissue "test plan"
*/
    select distinct
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