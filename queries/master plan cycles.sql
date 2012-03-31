/* 
This gets the test cycles on which a master plan has been run
*/
SELECT distinct 
    m.identifier,
    m.master_name,
    testcycle_desc,
    testcycle_start_date
FROM
    master_plan m, testplan_new p, testplan x,
    testcycle_info c, testresult r
    where master_id = m.identifier
    and x.tp_id = p.identifier
    and tpr_id = x.identifier
    and testcycle_id = c.identifier
order by master_name, testcycle_start_date