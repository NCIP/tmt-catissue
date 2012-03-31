SELECT
    prod_name,
    Ver_Name,
    Ver_Desc
FROM
    version_info v, product_info p 
where v.Prod_ID = p.identifier
order by prod_name