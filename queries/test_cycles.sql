SELECT
    distinct
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