package org.hackathon.settingservicereactive.repository;

import org.hackathon.settingservicereactive.domain.Dimension;
import org.springframework.data.repository.reactive.ReactiveCrudRepository;

public interface DimensionRepository extends ReactiveCrudRepository<Dimension, Integer> {

}
