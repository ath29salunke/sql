CREATE TEMP TABLE st_db_rrf_recruit_temp_timestamp AS
SELECT
    CURRENT_TIMESTAMP() AS ts;

INSERT INTO
    `tt-sandbox-001.phase2.st_db_rrf_recruit` (
        requisition_id,
group_company,
role_name,
role_id,
department_name,
department_id,
vertical_id,
vertical_name,
band,
level,
functional_area,
recruitment_start_date,
requisition_raised_from,
functional_area_hierarchy_1_name,
functional_area_hierarchy_1_code,
functional_area_hierarchy_2_name,
functional_area_hierarchy_2_code,
functional_area_hierarchy_3_name,
functional_area_hierarchy_3_code,
functional_area_hierarchy_4_name,
functional_area_hierarchy_4_code,
functional_area_hierarchy_5_name,
functional_area_hierarchy_5_code,
functional_area_hierarchy_6_name,
functional_area_hierarchy_6_code,
additional_skills,
comments_instructions,
requisition_raised_by_employee_id,
requisition_raised_by_employee_name,
requisition_raised_by_on_behalf_of_initiator_employee_id,
requisition_raised_by_on_behalf_of_initiator_employee_name,
requisition_location,
number_of_replacement_positions,
positions,
number_of_new_positions,
total_number_of_positions,
salary_range_currency,
salary_range_min,
salary_range_max,
salary_timeframe,
experience_range_from,
experience_range_to,
experience_range_years_months,
requisition_status,
requisition_archived_by,
requisition_archived_on,
requisition_archived_reason,
requisition_initiated_on,
requisition_activated_on,
requisition_activated_by,
requisition_hiring_lead,
requisition_hiring_manager,
job_id,
job_title,
asset_requirements,
additional_roles_and_responsibilities,
requisition_type,
department_assignees,
department_status,
department_action_taken_by,
department_action_taken_on,
function_assignees,
function_status,
function_action_taken_by,
function_action_taken_on,
level_3_assignees,
level_3_status,
level_3_action_taken_by,
level_3_action_taken_on,
level_4_assignees,
level_4_status,
level_4_action_taken_by,
level_4_action_taken_on,
level_5_assignees,
level_5_status,
level_5_action_taken_by,
level_5_action_taken_on,
level_6_assignees,
level_6_status,
level_6_action_taken_by,
level_6_action_taken_on,
requisition_last_approved_rejected_on,
requisition_last_approved_rejected_by,
job_description,
technical_competencies,
functional_domain_competencies,
behavioral_competencies,
target_companies,
start_date,
        end_date,
        load_timestamp
    )
SELECT
    `Requisition Id`,
`Group Company`,
`Role Name`,
`Role Id`,
`Department Name`,
`Department Id`,
`Vertical Id`,
`Vertical Name`,
`Band`,
`Level`,
`Functional Area`,
`Recruitment Start Date`,
`Requisition Raised From`,
`Functional Area Hierarchy 1 Name`,
`Functional Area Hierarchy 1 Code`,
`Functional Area Hierarchy 2 Name`,
`Functional Area Hierarchy 2 Code`,
`Functional Area Hierarchy 3 Name`,
`Functional Area Hierarchy 3 Code`,
`Functional Area Hierarchy 4 Name`,
`Functional Area Hierarchy 4 Code`,
`Functional Area Hierarchy 5 Name`,
`Functional Area Hierarchy 5 Code`,
`Functional Area Hierarchy 6 Name`,
`Functional Area Hierarchy 6 Code`,
`Additional Skills`,
`Comments_Instructions`,
`Requisition Raised By - Employee Id`,
`Requisition Raised By - Employee Name`,
`Requisition Raised By On Behalf Of Initiator - Employee Id`,
`Requisition Raised By On Behalf Of Initiator - Employee Name`,
`Requisition Location`,
`Number Of Replacement Positions`,
`Positions`,
`Number Of New Positions`,
`Total Number Of Positions`,
`Salary Range Currency`,
`Salary Range Min`,
`Salary Range Max`,
`Salary Timeframe`,
`Experience Range From`,
`Experience Range To`,
`Experience Range Years_Months`,
`Requisition Status`,
`Requisition Archived By`,
`Requisition Archived On`,
`Requisition Archived Reason`,
`Requisition Initiated On`,
`Requisition Activated On`,
`Requisition Activated By`,
`Requisition Hiring Lead`,
`Requisition Hiring Manager`,
`Job Id`,
`Job Title`,
`Asset Requirements`,
`Additional Roles & Responsibilities`,
`Requisition Type`,
`Department Assignees`,
`Department Status`,
`Department Action Taken By`,
`Department Action Taken On`,
`Function Assignees`,
`Function Status`,
`Function Action Taken By`,
`Function Action Taken On`,
`Level 3 Assignees`,
`Level 3 Status`,
`Level 3 Action Taken By`,
`Level 3 Action Taken On`,
`Level 4 Assignees`,
`Level 4 Status`,
`Level 4 Action Taken By`,
`Level 4 Action Taken On`,
`Level 5 Assignees`,
`Level 5 Status`,
`Level 5 Action Taken By`,
`Level 5 Action Taken On`,
`Level 6 Assignees`,
`Level 6 Status`,
`Level 6 Action Taken By`,
`Level 6 Action Taken On`,
`Requisition Last Approved_Rejected On`,
`Requisition Last Approved_Rejected By`,
`Job Description`,
`Technical Competencies`,
`Functional_Domain Competencies`,
`Behavioral Competencies`,
`Target Companies`,

    ts.ts AS start_date,
    NULL AS end_date,
    ts.ts AS load_timestamp
FROM
    `tt-sandbox-001.test.db_rrf_recruit` t
    JOIN st_db_rrf_recruit_temp_timestamp ts ON 1 = 1
WHERE
    `Requisition Id` NOT IN (
        SELECT
            st.requisition_id
        FROM
            `tt-sandbox-001.phase2.st_db_rrf_recruit` st
    );

-----
UPDATE `tt-sandbox-001.phase2.st_db_rrf_recruit` AS st
SET
    st.end_date = (
        SELECT
            ts
        FROM
            st_db_rrf_recruit_temp_timestamp
    )
WHERE
    st.end_date IS NULL
    AND st.requisition_id IN (
        SELECT
            `Requisition Id`
        FROM
            `tt-sandbox-001.test.db_rrf_recruit` AS t
        WHERE
           IFNULL(CAST(t.`Requisition Id` AS STRING), '') != IFNULL(st.requisition_id, '') OR
  IFNULL(CAST(t.`Group Company` AS STRING), '') != IFNULL(st.group_company, '') OR
  IFNULL(CAST(t.`Role Name` AS STRING), '') != IFNULL(st.role_name, '') OR
  IFNULL(CAST(t.`Role Id` AS STRING), '') != IFNULL(st.role_id, '') OR
  IFNULL(CAST(t.`Department Name` AS STRING), '') != IFNULL(st.department_name, '') OR
  IFNULL(CAST(t.`Department Id` AS STRING), '') != IFNULL(st.department_id, '') OR
  IFNULL(CAST(t.`Vertical Id` AS STRING), '') != IFNULL(st.vertical_id, '') OR
  IFNULL(CAST(t.`Vertical Name` AS STRING), '') != IFNULL(st.vertical_name, '') OR
  IFNULL(CAST(t.`Band` AS STRING), '') != IFNULL(st.band, '') OR
  IFNULL(CAST(t.`Level` AS STRING), '') != IFNULL(st.level, '') OR
  IFNULL(CAST(t.`Functional Area` AS STRING), '') != IFNULL(st.functional_area, '') OR
  IFNULL(CAST(t.`Recruitment Start Date` AS DATE), '1900-01-01') != IFNULL(st.recruitment_start_date, '1900-01-01') OR
  IFNULL(CAST(t.`Requisition Raised From` AS STRING), '') != IFNULL(st.requisition_raised_from, '') OR
  IFNULL(CAST(t.`Functional Area Hierarchy 1 Name` AS STRING), '') != IFNULL(st.functional_area_hierarchy_1_name, '') OR
  IFNULL(CAST(t.`Functional Area Hierarchy 1 Code` AS STRING), '') != IFNULL(st.functional_area_hierarchy_1_code, '') OR
  IFNULL(CAST(t.`Functional Area Hierarchy 2 Name` AS STRING), '') != IFNULL(st.functional_area_hierarchy_2_name, '') OR
  IFNULL(CAST(t.`Functional Area Hierarchy 2 Code` AS STRING), '') != IFNULL(st.functional_area_hierarchy_2_code, '') OR
  IFNULL(CAST(t.`Functional Area Hierarchy 3 Name` AS STRING), '') != IFNULL(st.functional_area_hierarchy_3_name, '') OR
  IFNULL(CAST(t.`Functional Area Hierarchy 3 Code` AS STRING), '') != IFNULL(st.functional_area_hierarchy_3_code, '') OR
  IFNULL(CAST(t.`Functional Area Hierarchy 4 Name` AS STRING), '') != IFNULL(st.functional_area_hierarchy_4_name, '') OR
  IFNULL(CAST(t.`Functional Area Hierarchy 4 Code` AS STRING), '') != IFNULL(st.functional_area_hierarchy_4_code, '') OR
  IFNULL(CAST(t.`Functional Area Hierarchy 5 Name` AS STRING), '') != IFNULL(st.functional_area_hierarchy_5_name, '') OR
  IFNULL(CAST(t.`Functional Area Hierarchy 5 Code` AS STRING), '') != IFNULL(st.functional_area_hierarchy_5_code, '') OR
  IFNULL(CAST(t.`Functional Area Hierarchy 6 Name` AS STRING), '') != IFNULL(st.functional_area_hierarchy_6_name, '') OR
  IFNULL(CAST(t.`Functional Area Hierarchy 6 Code` AS STRING), '') != IFNULL(st.functional_area_hierarchy_6_code, '') OR
  IFNULL(CAST(t.`Additional Skills` AS STRING), '') != IFNULL(st.additional_skills, '') OR
  IFNULL(CAST(t.`Comments_Instructions` AS STRING), '') != IFNULL(st.comments_instructions, '') OR
  IFNULL(CAST(t.`Requisition Raised By - Employee Id` AS STRING), '') != IFNULL(st.requisition_raised_by_employee_id, '') OR
  IFNULL(CAST(t.`Requisition Raised By - Employee Name` AS STRING), '') != IFNULL(st.requisition_raised_by_employee_name, '') OR
  IFNULL(CAST(t.`Requisition Raised By On Behalf Of Initiator - Employee Id` AS STRING), '') != IFNULL(st.requisition_raised_by_on_behalf_of_initiator_employee_id, '') OR
  IFNULL(CAST(t.`Requisition Raised By On Behalf Of Initiator - Employee Name` AS STRING), '') != IFNULL(st.requisition_raised_by_on_behalf_of_initiator_employee_name, '') OR
  IFNULL(CAST(t.`Requisition Location` AS STRING), '') != IFNULL(st.requisition_location, '') OR
  IFNULL(CAST(t.`Number Of Replacement Positions` AS STRING), '') != IFNULL(st.number_of_replacement_positions, '') OR
  IFNULL(CAST(t.`Positions` AS STRING), '') != IFNULL(st.positions, '') OR
  IFNULL(CAST(t.`Number Of New Positions` AS STRING), '') != IFNULL(st.number_of_new_positions, '') OR
  IFNULL(CAST(t.`Total Number Of Positions` AS STRING), '') != IFNULL(st.total_number_of_positions, '') OR
  IFNULL(CAST(t.`Salary Range Currency` AS STRING), '') != IFNULL(st.salary_range_currency, '') OR
  IFNULL(CAST(t.`Salary Range Min` AS STRING), '') != IFNULL(st.salary_range_min, '') OR
  IFNULL(CAST(t.`Salary Range Max` AS STRING), '') != IFNULL(st.salary_range_max, '') OR
  IFNULL(CAST(t.`Salary Timeframe` AS STRING), '') != IFNULL(st.salary_timeframe, '') OR
  IFNULL(CAST(t.`Experience Range From` AS STRING), '') != IFNULL(st.experience_range_from, '') OR
  IFNULL(CAST(t.`Experience Range To` AS STRING), '') != IFNULL(st.experience_range_to, '') OR
  IFNULL(CAST(t.`Experience Range Years_Months` AS STRING), '') != IFNULL(st.experience_range_years_months, '') OR
  IFNULL(CAST(t.`Requisition Status` AS STRING), '') != IFNULL(st.requisition_status, '') OR
  IFNULL(CAST(t.`Requisition Archived By` AS STRING), '') != IFNULL(st.requisition_archived_by, '') OR
  IFNULL(CAST(t.`Requisition Archived On` AS DATE), '1900-01-01') != IFNULL(st.requisition_archived_on, '1900-01-01') OR
  IFNULL(CAST(t.`Requisition Archived Reason` AS STRING), '') != IFNULL(st.requisition_archived_reason, '') OR
  IFNULL(CAST(t.`Requisition Initiated On` AS DATE), '1900-01-01') != IFNULL(st.requisition_initiated_on, '1900-01-01') OR
  IFNULL(CAST(t.`Requisition Activated On` AS DATE), '1900-01-01') != IFNULL(st.requisition_activated_on, '1900-01-01') OR
  IFNULL(CAST(t.`Requisition Activated By` AS STRING), '') != IFNULL(st.requisition_activated_by, '') OR
  IFNULL(CAST(t.`Requisition Hiring Lead` AS STRING), '') != IFNULL(st.requisition_hiring_lead, '') OR
  IFNULL(CAST(t.`Requisition Hiring Manager` AS STRING), '') != IFNULL(st.requisition_hiring_manager, '') OR
  IFNULL(CAST(t.`Job Id` AS STRING), '') != IFNULL(st.job_id, '') OR
  IFNULL(CAST(t.`Job Title` AS STRING), '') != IFNULL(st.job_title, '') OR
  IFNULL(CAST(t.`Asset Requirements` AS STRING), '') != IFNULL(st.asset_requirements, '') OR
  IFNULL(CAST(t.`Additional Roles & Responsibilities` AS STRING), '') != IFNULL(st.additional_roles_and_responsibilities, '') OR
  IFNULL(CAST(t.`Requisition Type` AS STRING), '') != IFNULL(st.requisition_type, '') OR
  IFNULL(CAST(t.`Department Assignees` AS STRING), '') != IFNULL(st.department_assignees, '') OR
  IFNULL(CAST(t.`Department Status` AS STRING), '') != IFNULL(st.department_status, '') OR
  IFNULL(CAST(t.`Department Action Taken By` AS STRING), '') != IFNULL(st.department_action_taken_by, '') OR
  IFNULL(CAST(t.`Department Action Taken On` AS DATE), '1900-01-01') != IFNULL(st.department_action_taken_on, '1900-01-01') OR
  IFNULL(CAST(t.`Function Assignees` AS STRING), '') != IFNULL(st.function_assignees, '') OR
  IFNULL(CAST(t.`Function Status` AS STRING), '') != IFNULL(st.function_status, '') OR
  IFNULL(CAST(t.`Function Action Taken By` AS STRING), '') != IFNULL(st.function_action_taken_by, '') OR
  IFNULL(CAST(t.`Function Action Taken On` AS DATE), '1900-01-01') != IFNULL(st.function_action_taken_on, '1900-01-01') OR
  IFNULL(CAST(t.`Level 3 Assignees` AS STRING), '') != IFNULL(st.level_3_assignees, '') OR
  IFNULL(CAST(t.`Level 3 Status` AS STRING), '') != IFNULL(st.level_3_status, '') OR
  IFNULL(CAST(t.`Level 3 Action Taken By` AS STRING), '') != IFNULL(st.level_3_action_taken_by, '') OR
  IFNULL(CAST(t.`Level 3 Action Taken On` AS DATE), '1900-01-01') != IFNULL(st.level_3_action_taken_on, '1900-01-01') OR
  IFNULL(CAST(t.`Level 4 Assignees` AS STRING), '') != IFNULL(st.level_4_assignees, '') OR
  IFNULL(CAST(t.`Level 4 Status` AS STRING), '') != IFNULL(st.level_4_status, '') OR
  IFNULL(CAST(t.`Level 4 Action Taken By` AS STRING), '') != IFNULL(st.level_4_action_taken_by, '') OR
  IFNULL(CAST(t.`Level 4 Action Taken On` AS DATE), '1900-01-01') != IFNULL(st.level_4_action_taken_on, '1900-01-01') OR
  IFNULL(CAST(t.`Level 5 Assignees` AS STRING), '') != IFNULL(st.level_5_assignees, '') OR
  IFNULL(CAST(t.`Level 5 Status` AS STRING), '') != IFNULL(st.level_5_status, '') OR
  IFNULL(CAST(t.`Level 5 Action Taken By` AS STRING), '') != IFNULL(st.level_5_action_taken_by, '') OR
  IFNULL(CAST(t.`Level 5 Action Taken On` AS DATE), '1900-01-01') != IFNULL(st.level_5_action_taken_on, '1900-01-01') OR
  IFNULL(CAST(t.`Level 6 Assignees` AS STRING), '') != IFNULL(st.level_6_assignees, '') OR
  IFNULL(CAST(t.`Level 6 Status` AS STRING), '') != IFNULL(st.level_6_status, '') OR
  IFNULL(CAST(t.`Level 6 Action Taken By` AS STRING), '') != IFNULL(st.level_6_action_taken_by, '') OR
  IFNULL(CAST(t.`Level 6 Action Taken On` AS DATE), '1900-01-01') != IFNULL(st.level_6_action_taken_on, '1900-01-01') OR
  IFNULL(CAST(t.`Requisition Last Approved_Rejected On` AS DATE), '1900-01-01') != IFNULL(st.requisition_last_approved_rejected_on, '1900-01-01') OR
  IFNULL(CAST(t.`Requisition Last Approved_Rejected By` AS STRING), '') != IFNULL(st.requisition_last_approved_rejected_by, '') OR
  IFNULL(CAST(t.`Job Description` AS STRING), '') != IFNULL(st.job_description, '') OR
  IFNULL(CAST(t.`Technical Competencies` AS STRING), '') != IFNULL(st.technical_competencies, '') OR
  IFNULL(CAST(t.`Functional_Domain Competencies` AS STRING), '') != IFNULL(st.functional_domain_competencies, '') OR
  IFNULL(CAST(t.`Behavioral Competencies` AS STRING), '') != IFNULL(st.behavioral_competencies, '') OR
  IFNULL(CAST(t.`Target Companies` AS STRING), '') != IFNULL(st.target_companies, '')
    );

INSERT INTO
    `tt-sandbox-001.phase2.st_db_rrf_recruit` (
        requisition_id,
group_company,
role_name,
role_id,
department_name,
department_id,
vertical_id,
vertical_name,
band,
level,
functional_area,
recruitment_start_date,
requisition_raised_from,
functional_area_hierarchy_1_name,
functional_area_hierarchy_1_code,
functional_area_hierarchy_2_name,
functional_area_hierarchy_2_code,
functional_area_hierarchy_3_name,
functional_area_hierarchy_3_code,
functional_area_hierarchy_4_name,
functional_area_hierarchy_4_code,
functional_area_hierarchy_5_name,
functional_area_hierarchy_5_code,
functional_area_hierarchy_6_name,
functional_area_hierarchy_6_code,
additional_skills,
comments_instructions,
requisition_raised_by_employee_id,
requisition_raised_by_employee_name,
requisition_raised_by_on_behalf_of_initiator_employee_id,
requisition_raised_by_on_behalf_of_initiator_employee_name,
requisition_location,
number_of_replacement_positions,
positions,
number_of_new_positions,
total_number_of_positions,
salary_range_currency,
salary_range_min,
salary_range_max,
salary_timeframe,
experience_range_from,
experience_range_to,
experience_range_years_months,
requisition_status,
requisition_archived_by,
requisition_archived_on,
requisition_archived_reason,
requisition_initiated_on,
requisition_activated_on,
requisition_activated_by,
requisition_hiring_lead,
requisition_hiring_manager,
job_id,
job_title,
asset_requirements,
additional_roles_and_responsibilities,
requisition_type,
department_assignees,
department_status,
department_action_taken_by,
department_action_taken_on,
function_assignees,
function_status,
function_action_taken_by,
function_action_taken_on,
level_3_assignees,
level_3_status,
level_3_action_taken_by,
level_3_action_taken_on,
level_4_assignees,
level_4_status,
level_4_action_taken_by,
level_4_action_taken_on,
level_5_assignees,
level_5_status,
level_5_action_taken_by,
level_5_action_taken_on,
level_6_assignees,
level_6_status,
level_6_action_taken_by,
level_6_action_taken_on,
requisition_last_approved_rejected_on,
requisition_last_approved_rejected_by,
job_description,
technical_competencies,
functional_domain_competencies,
behavioral_competencies,
target_companies,

        start_date,
        end_date,
        load_timestamp
    )
SELECT
    `Requisition Id`,
`Group Company`,
`Role Name`,
`Role Id`,
`Department Name`,
`Department Id`,
`Vertical Id`,
`Vertical Name`,
`Band`,
`Level`,
`Functional Area`,
`Recruitment Start Date`,
`Requisition Raised From`,
`Functional Area Hierarchy 1 Name`,
`Functional Area Hierarchy 1 Code`,
`Functional Area Hierarchy 2 Name`,
`Functional Area Hierarchy 2 Code`,
`Functional Area Hierarchy 3 Name`,
`Functional Area Hierarchy 3 Code`,
`Functional Area Hierarchy 4 Name`,
`Functional Area Hierarchy 4 Code`,
`Functional Area Hierarchy 5 Name`,
`Functional Area Hierarchy 5 Code`,
`Functional Area Hierarchy 6 Name`,
`Functional Area Hierarchy 6 Code`,
`Additional Skills`,
`Comments_Instructions`,
`Requisition Raised By - Employee Id`,
`Requisition Raised By - Employee Name`,
`Requisition Raised By On Behalf Of Initiator - Employee Id`,
`Requisition Raised By On Behalf Of Initiator - Employee Name`,
`Requisition Location`,
`Number Of Replacement Positions`,
`Positions`,
`Number Of New Positions`,
`Total Number Of Positions`,
`Salary Range Currency`,
`Salary Range Min`,
`Salary Range Max`,
`Salary Timeframe`,
`Experience Range From`,
`Experience Range To`,
`Experience Range Years_Months`,
`Requisition Status`,
`Requisition Archived By`,
`Requisition Archived On`,
`Requisition Archived Reason`,
`Requisition Initiated On`,
`Requisition Activated On`,
`Requisition Activated By`,
`Requisition Hiring Lead`,
`Requisition Hiring Manager`,
`Job Id`,
`Job Title`,
`Asset Requirements`,
`Additional Roles & Responsibilities`,
`Requisition Type`,
`Department Assignees`,
`Department Status`,
`Department Action Taken By`,
`Department Action Taken On`,
`Function Assignees`,
`Function Status`,
`Function Action Taken By`,
`Function Action Taken On`,
`Level 3 Assignees`,
`Level 3 Status`,
`Level 3 Action Taken By`,
`Level 3 Action Taken On`,
`Level 4 Assignees`,
`Level 4 Status`,
`Level 4 Action Taken By`,
`Level 4 Action Taken On`,
`Level 5 Assignees`,
`Level 5 Status`,
`Level 5 Action Taken By`,
`Level 5 Action Taken On`,
`Level 6 Assignees`,
`Level 6 Status`,
`Level 6 Action Taken By`,
`Level 6 Action Taken On`,
`Requisition Last Approved_Rejected On`,
`Requisition Last Approved_Rejected By`,
`Job Description`,
`Technical Competencies`,
`Functional_Domain Competencies`,
`Behavioral Competencies`,
`Target Companies`,
    ts.ts AS start_date,
    NULL AS end_date,
    ts.ts AS load_timestamp
FROM
    `tt-sandbox-001.test.db_rrf_recruit` t
    JOIN st_db_rrf_recruit_temp_timestamp ts ON 1 = 1
WHERE
    `Requisition Id` IN (
        SELECT
            st.requisition_id
        FROM
            `tt-sandbox-001.phase2.st_db_rrf_recruit` st
        WHERE
            st.end_date = (
                SELECT
                    ts
                FROM
                    st_db_rrf_recruit_temp_timestamp
            )
    );
