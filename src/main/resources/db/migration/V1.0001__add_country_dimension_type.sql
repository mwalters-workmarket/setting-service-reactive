--
-- Copyright 2019, WorkMarket, Inc. All Rights Reserved.
--

USE wm_setting;

INSERT INTO dimension_type (id, name) VALUES (15, 'country');

-- verification
SELECT * FROM dimension_type WHERE id = 15;
