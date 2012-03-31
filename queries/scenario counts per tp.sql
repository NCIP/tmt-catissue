/*
This query counts the number os scenarios to be tested in each catissue test plan
*/
SELECT
    tp_name ,
    count( distinct scenario_id)
FROM
    catissue_plan_xref x, catissue_plan p
where p.identifier = tp_id
group by tp_name