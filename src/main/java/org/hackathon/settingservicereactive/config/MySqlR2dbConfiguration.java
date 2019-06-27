package org.hackathon.settingservicereactive.config;

import com.github.jasync.r2dbc.mysql.JasyncConnectionFactory;
import com.github.jasync.sql.db.Configuration;
import com.github.jasync.sql.db.mysql.pool.MySQLConnectionFactory;
import com.github.jasync.sql.db.mysql.util.URLParser;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.data.r2dbc.function.DatabaseClient;

import java.nio.charset.StandardCharsets;

import io.r2dbc.spi.ConnectionFactory;


@org.springframework.context.annotation.Configuration
public class MySqlR2dbConfiguration {

  @Bean
  public DatabaseClient client(@Value("${connectionUrl}") String connectionUrl){

    Configuration configuration = URLParser.INSTANCE.parseOrDie(connectionUrl, StandardCharsets.UTF_8);
    ConnectionFactory connectionFactory = new JasyncConnectionFactory(new MySQLConnectionFactory(configuration));
    return DatabaseClient.create(connectionFactory);


  }
}
