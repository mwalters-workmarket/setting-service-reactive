--
-- Copyright 2019, WorkMarket, Inc. All Rights Reserved.
--

USE wm_setting;

ALTER TABLE dimension_value
  ADD COLUMN meta VARCHAR(512)
  DEFAULT NULL
  AFTER `value`, ALGORITHM=INPLACE, LOCK=NONE;

-- verification
SHOW CREATE TABLE dimension_value;
