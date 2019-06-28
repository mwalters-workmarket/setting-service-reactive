package org.hackathon.settingservicereactive.controller;

import org.hackathon.settingservicereactive.domain.Dimension;
import org.hackathon.settingservicereactive.dto.DimensionRequest;
import org.hackathon.settingservicereactive.service.SettingService;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@RestController
public class SettingController {

  private final SettingService settingService;

  //Constructor injection for the win!
  public SettingController(SettingService settingService){
    this.settingService = settingService;
  }

  @GetMapping(value = "/dimensions", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
  public Flux<Dimension> getAllSettings(){
    return settingService.getAllDimensions();
  }

  @PostMapping(value = "/dimension")
  public Mono<Dimension> createDimension(){
    return settingService.createDimension(new DimensionRequest((UUID.randomUUID()).toString(), 0));
  }


}
