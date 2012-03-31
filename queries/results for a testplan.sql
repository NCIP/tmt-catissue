SELECT
    tp_name,
    scenario_name,
    ta_name,
    tc_id, tpr_id,
    result, execution_date, auth_name
FROM
    testplan tp, scenario_info s, testarea_info ta,
testplan_info tpi, testcase_info tc, testresult, author_info au
where tp_id = 804
and scenario_id = s.identifier
and ta_id = ta.identifier
and tp_id = tpi.identifier
and tp.auto_id = tc.identifier
and tpr_id = tp.identifier
and testengg_id = au.identifier
order by 
   Scenario_ID,
    Tc_ID
