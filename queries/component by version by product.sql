SELECT
    prod_name,
    Ver_Name,
    Ver_Desc,
comp_name
FROM
    version_info v, product_info p , component_info c
where v.Prod_ID = p.identifier
and c.ver_id = v.identifier
order by prod_name, ver_name