SELECT
    ver_name,
    comp_name,
    IDENTIFIER,
    TA_Name,
    TA_Desc,
    TA_Url,
    prod_name
FROM
    catissue_testarea
where 
upper(ver_name) like '%REGRESSION%'