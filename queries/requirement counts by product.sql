SELECT
    prod_name, count(*)
FROM
    requirementlist r , product_info p
where p.identifier = r.prod_id
group by prod_name