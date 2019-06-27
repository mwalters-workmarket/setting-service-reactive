--
-- Copyright 2019, WorkMarket, Inc. All Rights Reserved.
--

CREATE SCHEMA IF NOT EXISTS wm_setting
  DEFAULT CHARACTER SET utf8;
USE wm_setting;

DROP TABLE IF EXISTS dimension_type;
CREATE TABLE dimension_type (
  id          INT UNSIGNED NOT NULL,
  name        CHAR(36)     NOT NULL,
  created_by  VARCHAR(36)  NULL,
  modified_by VARCHAR(36)  NULL,
  created_on  DATETIME(6)  NOT NULL DEFAULT NOW(6),
  modified_on DATETIME(6)  NOT NULL DEFAULT NOW(6) ON UPDATE NOW(6),
  PRIMARY KEY (id),
  UNIQUE idx_name (NAME)
)
  ENGINE = InnoDB;

DROP TABLE IF EXISTS dimension;
CREATE TABLE dimension (
  id                INT UNSIGNED NOT NULL AUTO_INCREMENT,
  dimension_type_id INT UNSIGNED NOT NULL,
  object_id         CHAR(36)              DEFAULT -1,
  created_by        VARCHAR(36)  NULL,
  modified_by       VARCHAR(36)  NULL,
  created_on        DATETIME(6)  NOT NULL DEFAULT NOW(6),
  modified_on       DATETIME(6)  NOT NULL DEFAULT NOW(6) ON UPDATE NOW(6),
  PRIMARY KEY (id),
  UNIQUE idx_uniq_obj_dimensiontype (dimension_type_id, object_id),
  FOREIGN KEY (dimension_type_id) REFERENCES dimension_type (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB AUTO_INCREMENT = 2;


DROP TABLE IF EXISTS setting_key;
CREATE TABLE setting_key (
  id          INT UNSIGNED         NOT NULL AUTO_INCREMENT,
  name        VARCHAR(128)         NOT NULL,
  label       VARCHAR(512)         NOT NULL,
  meta        VARCHAR(512)         NULL,
  enabled     TINYINT(1)  UNSIGNED NOT NULL DEFAULT 1,
  created_by  VARCHAR(36)          NULL,
  modified_by VARCHAR(36)          NULL,
  created_on  DATETIME(6)          NOT NULL DEFAULT NOW(6),
  modified_on DATETIME(6)          NOT NULL DEFAULT NOW(6) ON UPDATE NOW(6),
  PRIMARY KEY (id),
  UNIQUE idx_setting_key_uniq_name (name)
)
  ENGINE = InnoDB;


DROP TABLE IF EXISTS dimension_value;
CREATE TABLE dimension_value (
  id             INT UNSIGNED         NOT NULL AUTO_INCREMENT,
  dimension_id   INT UNSIGNED         NOT NULL,
  setting_key_id INT UNSIGNED         NOT NULL,
  value          TEXT                 NOT NULL,
  enabled        TINYINT(1)  NOT NULL DEFAULT 1,
  created_by     VARCHAR(36)          NULL,
  modified_by    VARCHAR(36)          NULL,
  created_on     DATETIME(6)          NOT NULL DEFAULT NOW(6),
  modified_on    DATETIME(6)          NOT NULL DEFAULT NOW(6) ON UPDATE NOW(6),
  PRIMARY KEY (id),
  UNIQUE idx_dim_settingkey (dimension_id, setting_key_id),
  FOREIGN KEY (dimension_id) REFERENCES dimension (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (setting_key_id) REFERENCES setting_key (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB;


DROP TABLE IF EXISTS setting_group;
CREATE TABLE setting_group (
  id          INT UNSIGNED        NOT NULL AUTO_INCREMENT,
  name        VARCHAR(128)        NOT NULL,
  enabled     TINYINT(1) UNSIGNED NOT NULL DEFAULT 1,
  created_by  VARCHAR(36)         NULL,
  modified_by VARCHAR(36)         NULL,
  created_on  DATETIME(6)         NOT NULL DEFAULT NOW(6),
  modified_on DATETIME(6)         NOT NULL DEFAULT NOW(6) ON UPDATE NOW(6),
  PRIMARY KEY (id),
  UNIQUE idx_setting_group_uniq_name (name)
)
  ENGINE = InnoDB;


DROP TABLE IF EXISTS group_dimension;
CREATE TABLE group_dimension (
  id               INT UNSIGNED        NOT NULL AUTO_INCREMENT,
  dimension_id     INT UNSIGNED        NOT NULL,
  setting_group_id INT UNSIGNED        NOT NULL,
  enabled          TINYINT(1) NOT NULL DEFAULT 1,
  created_by       VARCHAR(36)         NULL,
  modified_by      VARCHAR(36)         NULL,
  created_on       DATETIME(6)         NOT NULL DEFAULT NOW(6),
  modified_on      DATETIME(6)         NOT NULL DEFAULT NOW(6) ON UPDATE NOW(6),
  PRIMARY KEY (id),
  UNIQUE idx_uniq_group_dimension (dimension_id, setting_group_id),
  FOREIGN KEY (dimension_id) REFERENCES dimension (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (setting_group_id) REFERENCES setting_group (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB;


DROP TABLE IF EXISTS group_order;
CREATE TABLE group_order (
  id                 INT UNSIGNED NOT NULL AUTO_INCREMENT,
  group_dimension_id INT UNSIGNED NOT NULL,
  setting_key_id     INT UNSIGNED NOT NULL,
  setting_order      INT UNSIGNED NOT NULL,
  enabled            TINYINT(1) UNSIGNED NOT NULL DEFAULT 1,
  created_by         VARCHAR(36)  NULL,
  modified_by        VARCHAR(36)  NULL,
  created_on         DATETIME(6)  NOT NULL DEFAULT NOW(6),
  modified_on        DATETIME(6)  NOT NULL DEFAULT NOW(6) ON UPDATE NOW(6),
  PRIMARY KEY (id),
  UNIQUE idx_uniq_groupdimension_key (group_dimension_id, setting_key_id),
  FOREIGN KEY (group_dimension_id) REFERENCES group_dimension (id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (setting_key_id) REFERENCES setting_key (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB;

INSERT INTO dimension_type (id, name)
VALUES (1, 'default'), (2, 'business'), (3, 'company'), (4, 'department'), (5, 'user'), (6, 'special');

INSERT INTO dimension (id, dimension_type_id) VALUES (1, 1);
