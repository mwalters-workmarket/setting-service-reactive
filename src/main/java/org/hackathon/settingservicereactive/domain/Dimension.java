package org.hackathon.settingservicereactive.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Table
public class Dimension {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;

  @Column("object_id")
  private String objectId;

  @Column
  private Integer dimensionTypeId;


  public Dimension(){}

  public Dimension(String objectId, Integer dimensionTypeId){
    this.objectId = objectId;
    this.dimensionTypeId = dimensionTypeId;
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

  public Integer getDimensionTypeId() {
    return dimensionTypeId;
  }

  public void setDimensionTypeId(final Integer dimensionTypeId) {
    this.dimensionTypeId = dimensionTypeId;
  }
}
