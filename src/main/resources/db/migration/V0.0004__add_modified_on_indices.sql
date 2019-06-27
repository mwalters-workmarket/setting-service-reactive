--
-- Copyright 2019, WorkMarket, Inc. All Rights Reserved.
--

USE wm_setting;

ALTER TABLE `dimension` ADD INDEX `idx_modified_on` (`modified_on`), algorithm=INPLACE, lock=NONE;

ALTER TABLE `dimension_type` ADD INDEX `idx_modified_on` (`modified_on`), algorithm=INPLACE, lock=NONE;

ALTER TABLE `dimension_value` ADD INDEX `idx_modified_on` (`modified_on`), algorithm=INPLACE, lock=NONE;

ALTER TABLE `group_dimension` ADD INDEX `idx_modified_on` (`modified_on`), algorithm=INPLACE, lock=NONE;

ALTER TABLE `group_order` ADD INDEX `idx_modified_on` (`modified_on`), algorithm=INPLACE, lock=NONE;

ALTER TABLE `setting_group` ADD INDEX `idx_modified_on` (`modified_on`), algorithm=INPLACE, lock=NONE;

ALTER TABLE `setting_key` ADD INDEX `idx_modified_on` (`modified_on`), algorithm=INPLACE, lock=NONE;
