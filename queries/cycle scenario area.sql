SELECT
   distinct  TestCycle_Desc,
    scenario_name, ta_name
FROM
    testcycle_info c, testresult r, testplan p,
scenario_info s, testarea_info a
where  TestCycle_Desc like 'caTissue 2%'
and r.testcycle_id = c.identifier
and r.tpr_id = p.identifier
and p.scenario_id = s.identifier
and p.ta_id = a.identifier
order by     TestCycle_Desc,
    scenario_name