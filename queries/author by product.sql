SELECT
    prod_name,
    auth_name
FROM
    author_info a, product_info p , auth_prod_info x
where x.Product_ID = p.identifier
and x.auth_id = a.identifier
order by prod_name