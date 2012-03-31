SELECT
    unique_name master_plan,
    tp_id,
    AUTO_ID
FROM
    testplan_new P, testplan x
WHERE x.tp_id = p.identifier