package org.hackathon.settingservicereactive.dto;


import java.io.Serializable;

public class Dimension implements Serializable {

  private Integer id;
  private String objectId;

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
