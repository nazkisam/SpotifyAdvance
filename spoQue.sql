CREATE TABLE spotify(
Artist VARCHAR(255),
	Track VARCHAR(255),
  	Album VARCHAR(255),
    	Album_type VARCHAR(50),
      	Danceability FLOAT,
        	Energy FLOAT,
          	Loudness FLOAT,
            	Speechiness	FLOAT,
              Acousticness FLOAT,	
              Instrumentalness FLOAT,
              	Liveness FLOAT,
                	Valence FLOAT,
                  	Tempo FLOAT,
                    	Duration_min	FLOAT,
                       Title VARCHAR(255),
                       	Channel VARCHAR(255),
                        	Views FLOAT,	
                          Likes BIGINT,
                          	Comments BIGINT,
                            	Licensed BOOLEAN,
                              	official_video BOOLEAN,
                                	Stream BIGINT,	
                                  EnergyLiveness FLOAT,	
                                  most_played_on VARCHAR(50) 
)

/COPY spotify FROM 'D:\PLCPP\SQL\newproject\spotify\cleaned_dataset.csv'
DELIMITER ','
CSV HEADER


SELECT *FROM spotify





