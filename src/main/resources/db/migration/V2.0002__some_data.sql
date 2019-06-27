
# SPAs

replace into setting_key values (1, '/roles', 'route', '{}', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now() );
replace into setting_key values (2, '/employees', 'route', '{}', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now() );
replace into setting_key values (3, '/custom-fields','route', '{}', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now() );
replace into setting_key values (4, 'skynet.user',	'label'	,'{}',	1, 'CI flyway_migration', 'CI flyway_migration', now(), now());

replace into dimension_value values (1, 1, 1, 'true', '{"data": [{"key": "host","value": "http://localhost:9999/ci-spa/roles"},{"key": "route_name","value": "roles"}]}', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());
replace into dimension_value values (2, 1, 2, 'true', '{"data": [{"key": "host","value": "http://localhost:9999/ci-spa/employees"},{"key": "route_name","value": "employees"},{"key": "user_permissions","value": "MANAGE_MY_EMPLOYEE_ROLES"}]}', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now() );
replace into dimension_value values (3, 1, 3, 'true', '{"data": [{"key": "host","value": "http://localhost:9999/ci-spa/custom-fields"},{"key": "route_name","value": "custom-fields"}]}', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());
replace into dimension_value values (4, 1, 4, 'true', '{}', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now() );

replace into setting_group values (1, 'skynet.routes', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());
replace into setting_group values (2, 'skynet.enabled', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now() );

replace into group_dimension values (1, 1, 1, 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());
replace into group_dimension values (2, 1, 2, 1, 'CI flyway_migration', 'CI flyway_migration', now(), now() );

replace into group_order values (1, 1, 1, 0, 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());
replace into group_order values (2, 1, 2, 0, 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());
replace into group_order values (3, 1, 3, 0, 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());
replace into group_order values (4, 2, 4, 0, 1, 'CI flyway_migration', 'CI flyway_migration', now(), now() );



# Feature toggles

replace into setting_key values (5, 'featuretoggle.featuretoggle.temp_permissions_succession', 'Temporary Permissions Succession feature toggle', '{"data": [{"key": "openSignup","value": "EXPERIMENT"}]}', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now() );
replace into setting_key values (6, 'featuretoggle.permissions', '(Enterprise) Permissions feature toggle', '{"data": [{"key": "openSignup","value": "true"}]}', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now() );
replace into setting_key values (7, 'featuretoggle.permissions.api', 'Permissions feature toggle For V3 Endpoints', '{"data": [{"key": "openSignup","value": "true"}]}', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now() );
replace into setting_key values (8, 'featuretoggle.workers_search_company', 'worker search migrated from monolith', '{"data": [{"key": "openSignup","value": "false"}]}', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());

replace into dimension values (2, 30, '693c7c87-020d-4a80-bed6-a80f7779f56d', 'CI flyway_migration', 'CI flyway_migration', now(), now());

replace into dimension_value values (5, 1, 5, 'CONTROL', '{}', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());
replace into dimension_value values (6, 1, 6, 'true', '{}', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());
replace into dimension_value values (7, 1, 7, 'true', '{}', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());
replace into dimension_value values (8, 2, 8, 'true', '{}', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());

replace into setting_group values (3, 'feature-toggles', 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());
replace into group_dimension values (3, 1, 3, 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());

replace into group_order values (5, 3, 5, 0, 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());
replace into group_order values (6, 3, 6, 0, 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());
replace into group_order values (7, 3, 7, 0, 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());
replace into group_order values (8, 3, 8, 0, 1, 'CI flyway_migration', 'CI flyway_migration', now(), now());

