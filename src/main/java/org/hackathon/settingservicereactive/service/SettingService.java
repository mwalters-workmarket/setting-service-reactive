package org.hackathon.settingservicereactive.service;

import org.hackathon.settingservicereactive.domain.Dimension;
import org.hackathon.settingservicereactive.repository.DimensionRepository;
import org.springframework.stereotype.Service;

import reactor.core.publisher.Flux;

@Service
public class SettingService {


  private final DimensionRepository dimensionRepository;

  public SettingService(DimensionRepository dimensionRepository) {
    this.dimensionRepository = dimensionRepository;
  }

  public Flux<Dimension> getAllDimensions() {
    return dimensionRepository.findAll();
  }
}