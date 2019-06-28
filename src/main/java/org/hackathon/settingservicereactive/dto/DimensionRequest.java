package org.hackathon.settingservicereactive.dto;

public class DimensionRequest {

  private String objectId;
  private Integer dimensionTypeId;

  public DimensionRequest(final String objectId, Integer dimensionTypeId) {
    this.objectId = objectId;
    this.dimensionTypeId = dimensionTypeId;
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
