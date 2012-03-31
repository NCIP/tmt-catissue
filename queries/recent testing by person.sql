/* modified for TMT current in Feb 2012
*/
SELECT
    testcycle_desc, auth_name, --testcycle_start_date,
count(*)
FROM
    testresult tr, testcycle_info tc, author_info a
where execution_date > '01-JAN-12'
and tc.identifier = tr.testcycle_id
and a.identifier = testengg_id
group by testengg_id, testcycle_desc
order by testengg_id, testcycle_desc