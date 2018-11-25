drop table user_profile_img;
drop table user_profile;
create table user_profile
(
	id varchar2(20),
	passwd varchar2(20) not null,
	name varchar2(20) not null,
	email varchar2(100) not null,
	joinus	date not null,
	CONSTRAINT user_profile_pk primary key(id)
);

CREATE TABLE user_profile_img
( 
	id varchar2(20),
	profile_img BLOB default 0,
	background_img BLOB default 0,
	CONSTRAINT user_profile_img_pk primary key(id),
	CONSTRAINT user_profile_img_fk FOREIGN KEY (id) REFERENCES user_profile(id)
);
