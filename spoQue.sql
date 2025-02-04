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

--Exploring the data -EDA
SELECT *FROM spotify

SELECT COUNT(DISTINCT album) FROM spotify

SELECT COUNT(DISTINCT artist) FROM spotify

                          -- Easy Level
-- 1:Retrieve the names of all tracks that have more than 1 billion streams.
 
SELECT track,artist FROM spotify 
WHERE stream > 1000000000


-- 2.List all albums along with their respective artists.
SELECT DISTINCT album,artist FROM spotify


-- 3.Get the total number of comments for tracks where licensed = TRUE.
SELECT comments,track FROM spotify
WHERE licensed = TRUE 
GROUP BY 1,2

-- 4.Find all tracks that belong to the album type single.
SELECT track,album FROM
spotify
WHERE album LIKE '%Single%' ;


-- 5.Count the total number of tracks by each artist.
SELECT DISTINCT artist, COUNT(track)
FROM spotify
GROUP BY 1
ORDER BY 2 DESC;

                         -- Medium Level
-- 1.Calculate the average danceability of tracks in each album.
 SELECT AVG(danceability),album
 FROM spotify
 GROUP BY 2


-- 2.Find the top 5 tracks with the highest energy values.
SELECT track, MAX(energy) FROM spotify
GROUP BY track
ORDER BY 2 DESC
LIMIT 5;

-- 3.List all tracks along with their views and likes where official_video = TRUE.
SELECT track , views, likes FROM spotify
WHERE official_video = TRUE

-- 4.For each album, calculate the total views of all associated tracks.
select album,SUM(views)
FROM spotify
group by 1



-- 5.Retrieve the track names that have been streamed on Spotify more than YouTube.

select *from spotify

SELECT track,most_played_on FROM spotify 
WHERE most_played_on LIKE '%Spotify%'

                   -- Advanced Level
-- 1.Find the top 3 most-viewed tracks for each artist using window functions.
SELECT artist,track,top_songs FROM
(SELECT artist,track,
RANK() OVER(PARTITION BY artist ORDER BY views DESC) AS top_songs
FROM spotify) AS ranked_songs
WHERE top_songs <= 3


-- 2.Write a query to find tracks where the liveness score is above the average.

WITH average_liveness AS
( 
  SELECT AVG (liveness) AS av FROM spotify
)
SELECT track,av,liveness
FROM spotify , average_liveness
WHERE average_liveness.av < spotify.liveness


-- 3.Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.

WITH diff AS(
SELECT album,
MAX(energy) AS max_energy,
MIN(energy) AS min_energy
FROM spotify
GROUP BY 1
)
SELECT album, max_energy - min_energy as difference
FROM diff
ORDER BY 2 DESC;


/*














-- Find tracks where the energy-to-liveness ratio is greater than 1.2.
-- Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.

*/