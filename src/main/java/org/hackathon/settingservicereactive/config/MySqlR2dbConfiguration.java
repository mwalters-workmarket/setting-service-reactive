package org.hackathon.settingservicereactive.config;

import com.github.jasync.r2dbc.mysql.JasyncConnectionFactory;
import com.github.jasync.sql.db.mysql.pool.MySQLConnectionFactory;
import com.github.jasync.sql.db.mysql.util.URLParser;


import org.hackathon.settingservicereactive.repository.DimensionRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.r2dbc.config.AbstractR2dbcConfiguration;
import org.springframework.data.r2dbc.repository.config.EnableR2dbcRepositories;

import java.nio.charset.StandardCharsets;

import io.r2dbc.spi.ConnectionFactory;


@EnableR2dbcRepositories(basePackageClasses = DimensionRepository.class)
@Configuration
class MySqlR2dbConfiguration extends AbstractR2dbcConfiguration {

  private final String connectionUrl;

  public MySqlR2dbConfiguration(@Value("${connectionUrl}") String connectionUrl){
    this.connectionUrl = connectionUrl;
  }

  @Override
  public ConnectionFactory connectionFactory() {
    return new JasyncConnectionFactory(new MySQLConnectionFactory(
        URLParser.INSTANCE.parseOrDie(connectionUrl, StandardCharsets.UTF_8)));
  }


}