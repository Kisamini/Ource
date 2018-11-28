drop table user_profile_img;
drop table user_profile;
create table user_profile
(
	id varchar2(20),
	passwd varchar2(20) not null,
	username varchar2(20) not null,
	email varchar2(100) not null,
	joinus	date not null,
	CONSTRAINT user_profile_pk primary key(id)
);

CREATE TABLE user_profile_img
( 
	id varchar2(20),
	profile_img VARCHAR2(4000) DEFAULT '0.png' NOT null,
	background_img VARCHAR2(4000) default '0.png' NOT null,
  CONSTRAINT user_profile_img_pk PRIMARY KEY (id),
	CONSTRAINT user_profile_img_fk FOREIGN KEY (id) REFERENCES user_profile(id)
);

INSERT INTO user_profile VALUEs('test1','test1','test1','test1@test1.com',SYSDATE);
INSERT INTO user_profile VALUEs('test2','test2','test2','test2@test2.com',SYSDATE);
INSERT INTO user_profile VALUEs('test3','test3','test3','test3@test3.com',SYSDATE);
INSERT INTO user_profile VALUEs('test4','test4','test4','test4@test4.com',SYSDATE);
INSERT INTO user_profile VALUEs('test5','test5','test5','test5@test5.com',sysdate);
INSERT INTO user_profile VALUEs('test6','test6','test6','test6@test6.com',sysdate);
INSERT INTO user_profile VALUEs('test7','test7','test7','test7@test7.com',sysdate);
INSERT INTO user_profile VALUEs('test8','test8','test8','test8@test8.com',sysdate);
INSERT INTO user_profile VALUEs('test9','test9','test9','test9@test9.com',sysdate);

INSERT INTO USER_PROFILE_IMG(id) VALUES('test1');
INSERT INTO USER_PROFILE_IMG(id) VALUES('test2');
INSERT INTO USER_PROFILE_IMG(id) VALUES('test3');
INSERT INTO USER_PROFILE_IMG(id) VALUES('test4');
INSERT INTO USER_PROFILE_IMG(id) VALUES('test5');
INSERT INTO USER_PROFILE_IMG(id) VALUES('test6');
INSERT INTO USER_PROFILE_IMG(id) VALUES('test7');
INSERT INTO USER_PROFILE_IMG(id) VALUES('test8');
INSERT INTO USER_PROFILE_IMG(id) VALUES('test9');
COMMIT;
