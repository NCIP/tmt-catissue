/* modified for TMT current in Feb 2012
*/
SELECT
    Req_Desc,
    Req_ID,
    testcycle_desc, testcycle_start_date,
execution_date
FROM
    requirementlist r, tcinfo_req x, testresult tr, testcycle_info tc
where Req_ID like 'caTissuev2%'
and r.identifier = x.Req_Auto_ID
and tr.auto_id = x.auto_id
and tc.identifier = tr.testcycle_id
order by testcycle_start_date desc, testcycle_desc 