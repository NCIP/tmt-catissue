SELECT
    TP_ID, tp_name,
    Scenario_ID, scenario_name
    Comp_ID,
    TA_ID, ta_name,
    Auto_ID, tc_id
FROM
    testplan tp, scenario_info s, testarea_info ta,
testplan_info tpi, testcase_info tc
where tp_id = 804
and scenario_id = s.identifier
and ta_id = ta.identifier
and tp_id = tpi.identifier
and auto_id = tc.identifier
order by 
   Scenario_ID,
    Comp_ID,
    TA_ID,
    Auto_ID
