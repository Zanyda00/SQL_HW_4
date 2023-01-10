create table if not exists Genre (
	id serial primary key,
	ganre_name text
);

create table if not exists Artists (
	id serial primary key,
	artist_name text
);

create table if not exists GenreArtists (
	genre_id integer references Genre(id),
	artist_id integer references Artists(id),
	constraint ga primary key (genre_id, artist_id) 
);

create table if not exists Albums (
	id serial primary key,
	album_name text,
	year_of_pabl date
);

create table if not exists AlbumsArtists (
	album_id integer references Albums(id),
	artist_id integer references Artists(id),
	constraint aa primary key (album_id, artist_id) 
);

create table if not exists Tracks (
	id serial primary key,
	track_name text,
	duration time,
	album_id integer references Albums(id)
);

create table if not exists Collection (
	id serial primary key,
	coll_name text,
	year_of_pabl date
);

create table if not exists TrackCollection (
	track_id integer references Tracks(id),
	collection_id integer references Collection(id),
	constraint tc primary key (track_id, collection_id) 
);
