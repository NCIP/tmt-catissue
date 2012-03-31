SELECT
    tpro_type, year(tc_mod_date), 
    count(distinct auto_id)
FROM
    version_info v, product_info p , component_info c,
testarea_info a, component x, testcase_info tc,
testprocedure_info y
where upper(prod_name) = 'caTissue'
and v.Prod_ID = p.identifier
and c.ver_id = v.identifier
and a.comp_id = c.identifier
and x.ta_id = a.identifier
and tc.identifier = x.auto_id
and y.identifier = tc.tpro_id
group by tpro_type, year(tc_mod_date)
order by tpro_type, year(tc_mod_date)