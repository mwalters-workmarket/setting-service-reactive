--
-- Copyright 2019, WorkMarket, Inc. All Rights Reserved.
--

USE wm_setting;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE dimension_type;

INSERT INTO dimension_type (id, name)
VALUES
(0, 'default'),
(10, 'base'),
(20, 'business'),
(30, 'company'),
(40, 'department'),
(50, 'user'),
(60, 'special'),
(70, 'override');

SET FOREIGN_KEY_CHECKS = 1;

UPDATE dimension SET dimension_type_id = 0 WHERE id = 1;

-- verification
SELECT count(*) FROM dimension_type;

SELECT dimension_type_id FROM dimension WHERE id = 1;
