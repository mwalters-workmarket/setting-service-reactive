package org.hackathon.settingservicereactive.service;

import org.hackathon.settingservicereactive.domain.Dimension;
import org.hackathon.settingservicereactive.dto.DimensionRequest;
import org.hackathon.settingservicereactive.repository.DimensionRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@Service
public class SettingService {


  private final DimensionRepository dimensionRepository;

  public SettingService(DimensionRepository dimensionRepository) {
    this.dimensionRepository = dimensionRepository;
  }

  public Flux<Dimension> getAllDimensions() {
    return dimensionRepository.findAll();
  }

  @Transactional
  public Mono<Dimension> createDimension(final DimensionRequest dimensionRequest) {
    return dimensionRepository.save(new Dimension(dimensionRequest.getObjectId(), 0));
  }
}