# Intro to SQL

### Through the Terminal
1. `sqlite3` is Terminal command we'll run and it expects the name of the file
2. `sqlite3 <database_name>` will open a new shell for you where you can interface with the data in the database
3. If you wanna format your shell, `.mode column` and `.headers on`
4. In order to exit your shell, you will write `.exit`

### Through SQLite Browser

1. Install the SQLite Browser if you haven't already [here](http://sqlitebrowser.org/)
2. Open the SQLite Browser and click 'File -> Open DataBase'
3. Choose the `music.sqlite` file from this repo. This database is open source and maintained by Microsoft (SQL is no fun if you don't have any data)
4. Click the tab that says 'Execute SQL'. Type SQL queries in the box above. Press the play button. See the results of that query in the box below


# CRUD
Create - `INSERT INTO`/ALTER <table_name> ADD COLUMN /CREATE TABLE
Read - `SELECT`
Update - `UPDATE`/ALTER <table_name> UPDATE <type for the colum>
Delete - DROP TABLE/DELETE



## Challenges

1. Write the SQL to return all of the rows in the artists table?

```SQL
SELECT * FROM artists;
```

2. Write the SQL to select the artist with the name "Black Sabbath"

```SQL
SELECT * FROM artists WHERE name = 'Black Sabbath';
SELECT * FROM artists WHERE name IS 'Black Sabbath';
SELECT * FROM artists WHERE name LIKE 'black sabbath';
```

3. Write the SQL to create a table named 'fans' with an autoincrementing ID that's a primary key and a name field of type text

```sql
CREATE TABLE fans (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);
```

4. Write the SQL to alter the fans table to have a artist_id column type integer?

```sql
 ALTER TABLE fans ADD COLUMN artist_id INTEGER;
```

5. Write the SQL to add yourself as a fan of the Black Eyed Peas? ArtistId **169**

```sql
INSERT INTO fans (name, artist_id) VALUES ('Peter', 169);
```

6. Check out the [Faker gem](https://github.com/stympy/faker). `gem install faker`, open up irb, run `require 'faker'` and then generate a fake name for yourself using `Faker::Name.name`. How would you update your name in the fans table to be your new name?

   ```sql
UPDATE fans SET name = 'Bob' WHERE name = 'Peter';
   ```

7. Write the SQL to return fans that are not fans of the black eyed peas.

```sql
SELECT * FROM fans WHERE artist_id != 169;
```

8. Write the SQL to display an artists name next to their album title

```sql
SELECT artists.name, albums.title FROM artists INNER JOIN albums ON artists.id = albums.artist_id;
```

9. Write the SQL to display artist name, album name and number of tracks on that album

```sql
SELECT artists.name, albums.title, COUNT(tracks.id) AS 'track_count' FROM artists
INNER JOIN albums ON artists.id = albums.artist_id
JOIN tracks ON albums.id = tracks.album_id GROUP BY albums.title;
```

10. Write the SQL to return the name of all of the artists in the 'Pop' Genre

```sql
SELECT artists.name FROM artists
INNER JOIN albums ON artists.id = albums.artist_id
INNER JOIN tracks ON tracks.album_id = albums.id
INNER JOIN genres ON tracks.genre_id = genres.id
WHERE genres.name = 'Pop' GROUP BY artists.name;
```

## BONUS (very hard)

11. I want to return the names of the artists and their number of rock tracks
    who play Rock music
    and have move than 30 tracks
    in order of the number of rock tracks that they have
    from greatest to least

```sql

```
