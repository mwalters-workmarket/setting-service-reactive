package org.hackathon.settingservicereactive.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Table
public class Dimension {

  @Id
  private Integer id;

  @Column("object_id")
  private String objectId;

  public Dimension(){}
  public Dimension(Integer id, String objectId){
    this.id = id;
    this.objectId = objectId;
  }

  public Integer getId() {
    return id;
  }

  public void setId(final Integer id) {
    this.id = id;
  }

  public String getObjectId() {
    return objectId;
  }

  public void setObjectId(final String objectId) {
    this.objectId = objectId;
  }
}
