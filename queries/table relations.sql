SELECT
    t1.table_name,
    t2.table_name,
    FIRST_TABLE_JOIN_COLUMN,
    SECOND_TABLE_JOIN_COLUMN
FROM
    catissue_related_tables_map m,
catissue_query_table_data t1,
catissue_query_table_data t2
where t1.table_id = FIRST_TABLE_ID
and t2.table_id = SECOND_TABLE_ID
order by t1.table_name

