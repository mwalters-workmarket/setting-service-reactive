package org.hackathon.settingservicereactive.service;

import org.hackathon.settingservicereactive.dto.Dimension;
import org.springframework.data.r2dbc.function.DatabaseClient;
import org.springframework.stereotype.Service;

import java.util.Map;

import reactor.core.publisher.Flux;

@Service
public class SettingService {


  private final DatabaseClient databaseClient;

  public SettingService(DatabaseClient databaseClient) {
    this.databaseClient = databaseClient;
  }

  public Flux<Dimension> getAllDimensions() {
    return databaseClient.execute().sql("SELECT * FROM dimension").fetch().all().map(SettingService::toDimension);
  }


  private static Dimension toDimension(Map<String, Object> map) {
    Integer id = (Integer) map.get("id");
    String fn = (String) map.get("object_id");
    return new Dimension(id, fn);
  }
}
