SELECT
    ver_name, comp_name,
    TA_ID, ta_name,
    Auto_ID, tc_id
FROM
    testarea_info ta,
component x, testcase_info tc,
version_info v, component_info c
where ta_id = ta.identifier
and auto_id = tc.identifier
and ta_name = 'API Search'
and c.identifier = comp_id
and v.identifier = ver_id
order by 
    TA_ID,
    Auto_ID

