Reactive Setting Service


This is a toy version of setting service built reactive from ground up using _spring webflux_, _r2dbc_, _jasync_


Caveats:
* Flyway and R2DBC are not yet compatible so we're using the mvn:flyway command to apply flyway migrations before starting the app
* Due to some dependency mismatch between r2dbc and spring framework 5.2, not able to use latest version of r2dbc at the moment
(fails with message _java.lang.NoSuchMethodError: org.springframework.transaction.reactive.TransactionSynchronizationManager.currentTransaction()Lreactor/core/publisher/Mono;_)



Usage:


run the script `./runEverything.sh` to start mysql container, execute flyway migrations, start the app

then `curl localhost:8080/dimensions` to get all dimensions, streaming the response


