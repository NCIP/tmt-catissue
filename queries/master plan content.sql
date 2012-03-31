/* 
This gets the superset of test cases across all plans for a master plan
*/
SELECT distinct 
    m.identifier,
    m.master_name,
    auto_id,
    test_type,
    tc_id,
    tc_title
FROM
    master_plan m, testplan_new p, testplan x,
    testcase c
    where master_id = m.identifier
    and x.tp_id = p.identifier
    and c.identifier = auto_id
order by master_name