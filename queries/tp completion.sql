SELECT
    tp_name ,
    count( distinct scenario_id)
FROM
    catissue_plan_xref x, catissue_plan p
where tp_name = 'caTissuev2.0I14W2_Linux_MySQL_Fresh_MAGE'
p.identifier = tp_id
group by tp_name