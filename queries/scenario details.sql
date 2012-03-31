SELECT
    s.identifier,
scenario_name,
    type,
    value
FROM
    platform_value v,
platform_type t,
scenario x,
scenario_info s
where v.type_id = t.identifier
and x.scenario_id = s.identifier
and x.value_id = v.identifier
order by s.identifier