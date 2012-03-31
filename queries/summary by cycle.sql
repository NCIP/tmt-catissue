/* modified for TMT current in Feb 2012
*/
SELECT
    testcycle_desc, auth_name, --testcycle_start_date,
count(*)
FROM
    testresult tr, testcycle_info tc, author_info a
where testcycle_desc like 'caTissuev2%'
and tc.identifier = tr.testcycle_id
and a.identifier = testengg_id
group by testcycle_desc, testengg_id
order by testcycle_desc, testengg_id