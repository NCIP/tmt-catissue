SELECT
    concat('create or replace view scenario_' , lower(type) ,
 ' as select scenario_id, value ', lower(type),
' from platform_value v, scenario s where type_id = ' , IDENTIFIER, 
' and s.value_id = v.identifier;')
    
FROM
    platform_type