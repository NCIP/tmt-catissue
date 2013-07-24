/*L
  							tmt-catissue
  							 (Nov, 2012)


  DEFINITIONS:

  	PROVIDER: the National Cancer Institute (NCI), a participating institute of the National Institutes of Health (NIH), and an agency of the United States Government.

  	SOFTWARE: the human readable source code form, the machine readable, binary, object code form, and the related documentation for the modules of the tmt-catissue software package, which provides a set of utility scripts from the data dump from caTissue test management tool (TMT).

  	RECIPIENT: the party that downloads the software.

  By downloading or otherwise receiving the SOFTWARE, RECIPIENT may use and/or redistribute the SOFTWARE, with or without modification, subject to RECIPIENTs agreement to the following terms:

  1.	THE SOFTWARE SHALL NOT BE USED IN THE TREATMENT OR DIAGNOSIS OF HUMAN SUBJECTS.  RECIPIENT is responsible for compliance with all laws and regulations applicable to the use of the SOFTWARE.
  2.	The SOFTWARE that is distributed pursuant to this Agreement has been created by United States Government employees. In accordance with Title 17 of the United States Code, section 105, the SOFTWARE is not subject to copyright protection in the United States.  Other than copyright, all rights, title and interest in the SOFTWARE shall remain with the PROVIDER.
  3.	RECIPIENT agrees to acknowledge PROVIDERs contribution of the SOFTWARE in all written publications containing any data or information regarding or resulting from use of the SOFTWARE.
  4.	THE SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT ARE DISCLAIMED. IN NO EVENT SHALL THE PROVIDER OR THE INDIVIDUAL DEVELOPERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  5.	RECIPIENT agrees not to use any trademarks, service marks, trade names, logos or product names of NCI or NIH to endorse or promote products derived from the SOFTWARE without specific, prior and written permission.
  6.	For sake of clarity, and not by way of limitation, RECIPIENT may add its own copyright statement to its modifications or derivative works of the SOFTWARE and may provide additional or different license terms and conditions in its sublicenses of modifications or derivative works of the SOFTWARE provided that RECIPIENTs use, reproduction, and distribution of the SOFTWARE otherwise complies with the conditions stated in this Agreement. Whenever Recipient distributes or redistributes the SOFTWARE, a copy of this Agreement must be included with each copy of the SOFTWARE.
L*/

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
and c.identifier = ta.comp_id
and v.identifier = c.ver_id
and p.identifier = v.prod_id;

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

create or replace view testresult_view as
SELECT
    r.IDENTIFIER,
    TestCycle_desc,
    tp_name,
    r.Auto_ID,
    TestEngg_ID,
    Execution_Comment,
    Result,
    Execution_Date
FROM
    testresult r, testcycle_info cy, testplan p, testplan_info pi
    where TPR_ID = p.identifier
    and tp_id = pi.identifier
    and cy.identifier = TestCycle_ID;


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

create table cycle_build (
testcycle_id int(10),
build_id int(10)
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





