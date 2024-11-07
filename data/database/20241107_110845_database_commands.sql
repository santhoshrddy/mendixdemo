DROP INDEX "idx_administration$account_submetaobjectname_asc";
ALTER TABLE "myfirstmodule$entity" RENAME TO "75ba2212000149539fdad214a55e0d89";
ALTER TABLE "administration$account" DROP COLUMN "submetaobjectname";
DELETE FROM "mendixsystem$attribute" 
 WHERE "id" = '0b457a57-9371-35ad-b275-64c69698df0c';
DELETE FROM "mendixsystem$index" 
 WHERE "id" = '9215fea0-5577-3eea-a703-0db568b50bea';
DELETE FROM "mendixsystem$index_column" 
 WHERE "index_id" = '9215fea0-5577-3eea-a703-0db568b50bea';
DELETE FROM "mendixsystem$entity" 
 WHERE "id" = 'cc6d842c-68e2-498a-b33f-9cc3ebf497e1';
DELETE FROM "mendixsystem$entityidentifier" 
 WHERE "id" = 'cc6d842c-68e2-498a-b33f-9cc3ebf497e1';
DELETE FROM "mendixsystem$sequence" 
 WHERE "attribute_id" IN (SELECT "id"
 FROM "mendixsystem$attribute"
 WHERE "entity_id" = 'cc6d842c-68e2-498a-b33f-9cc3ebf497e1');
DELETE FROM "mendixsystem$remote_primary_key" 
 WHERE "entity_id" = 'cc6d842c-68e2-498a-b33f-9cc3ebf497e1';
DELETE FROM "mendixsystem$attribute" 
 WHERE "entity_id" = 'cc6d842c-68e2-498a-b33f-9cc3ebf497e1';
CREATE TABLE "myfirstmodule$employee" (
	"id" BIGINT NOT NULL,
	"employeeid" INT NULL,
	"name" VARCHAR_IGNORECASE(200) NULL,
	"desgination" VARCHAR_IGNORECASE(200) NULL,
	"dateofjoining" TIMESTAMP NULL,
	"contactinfo" INT NULL,
	PRIMARY KEY("id"));
INSERT INTO "mendixsystem$entity" ("id", 
"entity_name", 
"table_name", 
"remote", 
"remote_primary_key")
 VALUES ('3e6d83dd-841b-484f-86a3-e7b9c77ffada', 
'MyFirstModule.Employee', 
'myfirstmodule$employee', 
false, 
false);
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('ef0f79b2-45f5-4418-a35c-b918b3463fb6', 
'3e6d83dd-841b-484f-86a3-e7b9c77ffada', 
'EmployeeID', 
'employeeid', 
3, 
0, 
'0', 
false);
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('e54bd149-ddf6-492d-bc5c-78040a82082e', 
'3e6d83dd-841b-484f-86a3-e7b9c77ffada', 
'Name', 
'name', 
30, 
200, 
'', 
false);
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('d164aecd-e5bd-42c7-81e3-406c6ea97dc1', 
'3e6d83dd-841b-484f-86a3-e7b9c77ffada', 
'Desgination', 
'desgination', 
30, 
200, 
'', 
false);
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('d11a4920-ab8d-41e0-b83b-4450877225e4', 
'3e6d83dd-841b-484f-86a3-e7b9c77ffada', 
'DateofJoining', 
'dateofjoining', 
20, 
0, 
'', 
false);
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('d79f51cb-b544-41d2-bc93-92c4e648e490', 
'3e6d83dd-841b-484f-86a3-e7b9c77ffada', 
'ContactInfo', 
'contactinfo', 
3, 
0, 
'0', 
false);
CREATE TABLE "myfirstmodule$employee_department" (
	"myfirstmodule$employeeid" BIGINT NOT NULL,
	"myfirstmodule$departmentid" BIGINT NOT NULL,
	PRIMARY KEY("myfirstmodule$employeeid","myfirstmodule$departmentid"),
	CONSTRAINT "uniq_myfirstmodule$employee_department_myfirstmodule$employeeid" UNIQUE ("myfirstmodule$employeeid"));
CREATE INDEX "idx_myfirstmodule$employee_department_myfirstmodule$department_myfirstmodule$employee" ON "myfirstmodule$employee_department" ("myfirstmodule$departmentid" ASC,"myfirstmodule$employeeid" ASC);
INSERT INTO "mendixsystem$association" ("id", 
"association_name", 
"table_name", 
"parent_entity_id", 
"child_entity_id", 
"parent_column_name", 
"child_column_name", 
"index_name")
 VALUES ('641bc02b-ea9e-4f8f-b105-bffd1f8823b5', 
'MyFirstModule.Employee_Department', 
'myfirstmodule$employee_department', 
'3e6d83dd-841b-484f-86a3-e7b9c77ffada', 
'5265bbad-7550-4620-8440-1f4a992d7a33', 
'myfirstmodule$employeeid', 
'myfirstmodule$departmentid', 
'idx_myfirstmodule$employee_department_myfirstmodule$department_myfirstmodule$employee');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_myfirstmodule$employee_department_myfirstmodule$employeeid', 
'641bc02b-ea9e-4f8f-b105-bffd1f8823b5', 
'12f5c330-3f3d-34e4-92d8-679a16546791');
CREATE TABLE "myfirstmodule$department" (
	"id" BIGINT NOT NULL,
	"name" VARCHAR_IGNORECASE(200) NULL,
	PRIMARY KEY("id"));
INSERT INTO "mendixsystem$entity" ("id", 
"entity_name", 
"table_name", 
"remote", 
"remote_primary_key")
 VALUES ('5265bbad-7550-4620-8440-1f4a992d7a33', 
'MyFirstModule.Department', 
'myfirstmodule$department', 
false, 
false);
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('367f4933-1746-4ba4-84c0-b6c93430a203', 
'5265bbad-7550-4620-8440-1f4a992d7a33', 
'Name', 
'name', 
30, 
200, 
'', 
false);
CREATE TABLE "myfirstmodule$department_department" (
	"myfirstmodule$departmentid1" BIGINT NOT NULL,
	"myfirstmodule$departmentid2" BIGINT NOT NULL,
	PRIMARY KEY("myfirstmodule$departmentid1","myfirstmodule$departmentid2"),
	CONSTRAINT "uniq_myfirstmodule$department_department_myfirstmodule$departmentid1" UNIQUE ("myfirstmodule$departmentid1"));
CREATE INDEX "idx_myfirstmodule$department_department_myfirstmodule$department_myfirstmodule$department" ON "myfirstmodule$department_department" ("myfirstmodule$departmentid2" ASC,"myfirstmodule$departmentid1" ASC);
INSERT INTO "mendixsystem$association" ("id", 
"association_name", 
"table_name", 
"parent_entity_id", 
"child_entity_id", 
"parent_column_name", 
"child_column_name", 
"index_name")
 VALUES ('abfe53ea-fa27-44d5-8ffa-720b697e6342', 
'MyFirstModule.Department_Department', 
'myfirstmodule$department_department', 
'5265bbad-7550-4620-8440-1f4a992d7a33', 
'5265bbad-7550-4620-8440-1f4a992d7a33', 
'myfirstmodule$departmentid1', 
'myfirstmodule$departmentid2', 
'idx_myfirstmodule$department_department_myfirstmodule$department_myfirstmodule$department');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_myfirstmodule$department_department_myfirstmodule$departmentid1', 
'abfe53ea-fa27-44d5-8ffa-720b697e6342', 
'0731cc5e-0fc8-3ff4-b9bc-89e0b3834c28');
DELETE FROM "administration$account" 
 WHERE "id" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
DELETE FROM "system$user" 
 WHERE "id" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
DELETE FROM "system$user_language" 
 WHERE "system$userid" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
DELETE FROM "system$userroles" 
 WHERE "system$userid" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
DELETE FROM "system$user_timezone" 
 WHERE "system$userid" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
UPDATE "system$filedocument"
 SET "system$owner" = NULL
 WHERE "system$owner" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
DELETE FROM "system$tokeninformation_user" 
 WHERE "system$userid" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
UPDATE "system$processedqueuetask"
 SET "system$owner" = NULL
 WHERE "system$owner" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
DELETE FROM "system$workflowusertask_targetusers" 
 WHERE "system$userid" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
UPDATE "system$workflow"
 SET "system$owner" = NULL
 WHERE "system$owner" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
DELETE FROM "system$session_user" 
 WHERE "system$userid" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
DELETE FROM "system$workflowactivity_taskactor" 
 WHERE "system$userid" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
DELETE FROM "system$workflowusertask_assignee" 
 WHERE "system$userid" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
UPDATE "system$filedocument"
 SET "system$changedby" = NULL
 WHERE "system$changedby" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
UPDATE "system$synchronizationerror"
 SET "system$owner" = NULL
 WHERE "system$owner" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
DELETE FROM "system$userreportinfo_user" 
 WHERE "system$userid" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
UPDATE "system$queuedtask"
 SET "system$owner" = NULL
 WHERE "system$owner" IN (SELECT "id"
 FROM "75ba2212000149539fdad214a55e0d89");
DROP TABLE "75ba2212000149539fdad214a55e0d89";
UPDATE "mendixsystem$version"
 SET "versionnumber" = '4.2', 
"lastsyncdate" = '20241107 11:08:45';
