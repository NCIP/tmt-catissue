create or replace view testcase as
SELECT
    tc.IDENTIFIER,
    tc_id,
    TC_title,
    auth_name author_name,
    tc_details,
    P_name priority,
    TC_Entered_date,
    TC_Mod_Date,
    TPro_type test_type,
    verification_logic
FROM
    testcase_info tc, author_info au,
priority_info pr, testprocedure_info ty
where au.identifier = Auth_ID
and pr.p_id = tc.p_id
and ty.identifier = tpro_id;

create or replace view catissue_testarea as
SELECT
    ta.IDENTIFIER,
    TA_Name,
    TA_Desc,
    TA_Url,
    prod_name,
    ver_name, comp_name
FROM
    testarea_info ta,
version_info v, component_info c,
product_info p
where prod_name = 'caTissue' 
and c.identifier = comp_id
and v.identifier = ver_id
and p.identifier = prod_id;

create or replace view catissue_plan_xref as
SELECT
    p.IDENTIFIER,
    p.TP_ID,
    p.Scenario_ID,
    p.Comp_ID,
    p.TA_ID,
    p.Auto_ID
FROM
    testplan p, catissue_testarea a
where a.identifier = p.ta_id;

create or replace view catissue_plan as
SELECT
    IDENTIFIER,
    TP_Name,
    TP_Url,
    TP_Desc
FROM
    testplan_info
where identifier in
(select distinct tp_id from catissue_plan_xref);

create table scenario2 as 
select * from scenario_info;


alter table scenario2  
add os varchar(50),  
add clientos varchar(50),
add browser varchar(50),
add server_os varchar(50),
add dbms varchar(50)
;


create table organization (
org_id int(10),
org_name varchar(255)
);

create table build (
build_id int(10),
build_name varchar(255)
);

create table person_org (
auth_id int(10),
org_id int(10)
);

insert into organization(org_id,org_name) values (1,'Persistent');
insert into organization(org_id,org_name) values (2,'Washington University');
insert into organization(org_id,org_name) values (3,'Adopters');
insert into organization(org_id,org_name) values (4,'SAIC-F');
insert into organization(org_id,org_name) values (5,'NCI');


create table testset as
SELECT
    distinct
    tp_id,
    testcycle_id
FROM
    testresult tr, testplan tp
where tpr_id = tp.identifier;

create table testplan_new 
(identifier int(10),
tp_name varchar(50),
master_id int(10),
master_name varchar(50));

/* Load testplan_new first before the next step */
create table master_plan as
SELECT
   min(identifier) identifier, master_name
FROM
    testplan_new
group by master_name
order by identifier;





