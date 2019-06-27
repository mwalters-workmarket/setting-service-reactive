package org.hackathon.settingservicereactive.controller;

import org.hackathon.settingservicereactive.domain.Dimension;
import org.hackathon.settingservicereactive.service.SettingService;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import reactor.core.publisher.Flux;

@RestController
public class SettingController {

  private final SettingService settingService;

  //Constructor injection for the win!
  public SettingController(SettingService settingService){
    this.settingService = settingService;
  }

  @GetMapping(value = "/dimensions", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
  Flux<Dimension> getAllSettings(
  ){
    return settingService.getAllDimensions();
  }

}
