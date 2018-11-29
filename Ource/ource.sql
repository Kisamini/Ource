drop table user_profile_img;
drop table user_profile;
DROP TABLE user_follow;
DROP SEQUENCE fol_id_seq;

CREATE SEQUENCE fol_id_seq
           START WITH   1
           NOMAXVALUE
           NOCYCLE;

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
	profile_img VARCHAR2(4000) DEFAULT '0' NOT null,
	background_img VARCHAR2(4000) default '0' NOT null,
  CONSTRAINT user_profile_img_pk PRIMARY KEY (id),
	CONSTRAINT user_profile_img_fk FOREIGN KEY (id) REFERENCES user_profile(id)
);

CREATE TABLE user_follow
(
	fol_id	NUMBER,
  mem_id	VARCHAR(20),
  target_mem_id VARCHAR(20),
  fol_datetime	DATE,
  CONSTRAINT user_follow_pk PRIMARY KEY (fol_id)
);

CREATE OR REPLACE PROCEDURE user_do_follow
(
	p_fol_id	IN	user_follow.fol_id%type,
  p_mem_id	IN	user_follow.mem_id%type,
  p_target_mem_id IN	user_follow.target_mem_id%type,
  p_fol_datetime	IN	user_follow.fol_datetime%type
)
is
begin
	insert into user_follow values(fol_id_seq.nextval, p_mem_id,p_target_mem_id,SYSDATE);
	commit;
end;

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

UPDATE USER_PROFILE_IMG SET PROFILE_IMG = '0', BACKGROUND_IMG = '0' WHERE ID='test1';