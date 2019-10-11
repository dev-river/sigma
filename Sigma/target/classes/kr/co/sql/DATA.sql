-- 웹페이지 메뉴버튼 테이블                                                                 #191010 최진우 생성
create table menuinfo(
name varchar2(20) primary key,
degree number not null
);

-- 회원정보 테이블
create table userinfo(
id varchar2(20) primary key,
nickname varchar2(20) constraint userinfo_nickname_nn not null constraint userinfo_nickname_uni unique,
name varchar2(20) constraint userinfo_name_nn not null,
pw varchar2(20) constraint userinfo_pw_nn not null,
accessing number default 0,
author varchar2(10) constraint userinfo_author_nn not null,
phone varchar2(20) constraint userinfo_phone_nn not null,
birth date,
sex varchar2(6),
address varchar2(50),
joindate date default sysdate,
cash number default 0 constraint userinfo_cash_nn not null,
compname varchar2(20) constraint userinfo_compname_uni unique,
compdetail varchar2(1000),
compnum number constraint userinfo_compnum_uni unique,
compaddress varchar2(100),
compphone varchar2(20),
filepath varchar2(50)
);

--게임상세보기 테이블
create table gameDetail(
num number primary key,
title varchar2(50) constraint gameDetail_title_nn not null,
content varchar2(4000) constraint gameDetail_content_nn not null,
writer varchar2(20) constraint gameDetail_writer_nn not null,
regidate date default sysdate,
category varchar2(20) constraint gameDetail_category_nn not null,
price number constraint gameDetail_price_nn not null,
dcrate number constraint gameDetail_dcrate_nn not null,
manCount number default 0,
womanCount number default 0,
totalAge default 0,
profit number default 0,
buyCharge number default 0,
viewcnt number default 0,
filepath varchar2(50),
gameFilePath varchar2(50) constraint gameDetail_gameFilePath_nn not null,
status varchar2(5) default'o' constraint gameDetail_status_nn not null
);

--게임상세보기 파일경로 테이블 (이미지)
create table gameDetailFile(
num number primary key,
gdnum number constraint gameDetailFile_gdnum_nn not null,
filename varchar2(50),
uploaddate date default sysdate,
constraint fk_gameDetailFile_gdnum foreign key(gdnum) references gameDetail(num)
);

--게임 할인요청 관리 테이블
 create table gameDetailDC(
 num number primary key,
 gdnum number constraint gameDetailDC_gdnum_nn not null,
 dcrate number constraint gameDetailDC_dcrate_nn not null,
 goal number constraint gameDetailDC_goal_nn not null,
 rqstartdate date constraint gameDetailDC_rqstartdate_nn not null,
 rqenddate date constraint gameDetailDC_rqenddate_nn not null,
 dcstartdate date constraint gameDetailDC_dcstartdate_nn not null,
 dcenddate date constraint gameDetailDC_dcenddate_nn not null,
 constraint fk_gameDetailDC_gdnum foreign key(gdnum) references gameDetail(num)
 );
 
 --일반인 리뷰 테이블
 create table gameReview(
 num number primary key,
 gdnum number constraint gameReview_gdnum_nn not null,
 writer varchar2(20) constraint gameReview_writer_nn not null,
 content varchar2(4000) constraint gameReview_content_nn not null,
 regidate date default sysdate,
 updatedate date,
 recommend varchar2(20) constraint gameReview_like_nn not null,
 assistYes number constraint gameReview_assistYes_nn not null,
 assistNo number constraint gameReview_assistNo_nn not null,
 constraint fk_gameReview_gdnum foreign key(gdnum) references gameDetail(num)
 );
 
-- 알림 테이블
create table alarm(
num number primary key,
id varchar2(20) constraint alarm_id_nn not null,
rvnum number not null,
alarmtype varchar2(15) constraint alarm_type_nn not null,
content varchar2(500),
updatedate date default sysdate,
constraint fk_alarm_id foreign key(id) references userinfo(id)
);

--개인 계정 구독목록 테이블
create table FavoriteStore(
num number primary key,
id varchar2(20) constraint FavoriteStore_id_nn not null,
compnum number,
constraint fk_FavoriteStore_id foreign key(id) references userinfo(id),
constraint fk_FavoriteStore_compnum foreign key(compnum) references userinfo(compnum)
);

--구매목록 테이블
create table buyList(
num number primary key,
id varchar2(20) constraint buyList_id_nn not null,
gdnum number constraint buyList_gdnum_nn not null constraint buyList_gdnum_uni unique,
buyprice number constraint buyList_buyprice_nn not null,
buydate date default sysdate,
constraint fk_buyList_id foreign key(id) references userinfo(id),
constraint fk_buyList_gdnum foreign key(gdnum) references gameDetail(num)
);

--환불목록 테이블
create table refundList(
num number primary key,
buynum number constraint refundList_buynum_nn not null constraint refundList_buynum_uni unique,
status varchar2(5) default '-' constraint refuntList_status_nn not null,
content varchar2(1000),
compcontent varchar2(1000),
updatedate date default sysdate,
refunddate date,
constraint fk_refundList_buynum foreign key(buynum) references buyList(num)
);


--최근 본게임 테이블
create table latestGameList(
num number primary key,
gdnum number constraint latestGameList_gdnum_nn not null constraint latestGameList_gdnum_uni unique,
updatedate date default sysdate,
constraint fk_latestGameList_gdnum foreign key(gdnum) references gameDetail(num)
);

--찜목록 테이블
create table zzimList(
num number primary key,
id varchar2(20) constraint zzimList_num_nn not null,
gdnum number constraint zzimList_gdnum_nn not null constraint zzimList_gdnum_uni unique,
updatedate date default sysdate,
constraint fk_zzimList_id foreign key(id) references userinfo(id),
constraint fk_zzimList_gdnum foreign key(gdnum) references gameDetail(num)
);

--친구목록 테이블
create table friendList(
num number primary key,
myid varchar2(20) constraint friendList_myid_nn not null,
targetid varchar2(20) constraint friendList_targetid_nn not null,
status varchar2(5) default '-' constraint friendList_status_nn not null,
constraint fk_friendList_myid foreign key(myid) references userinfo(id),
constraint fk_friendList_targetid foreign key(targetid) references userinfo(id)
);

--친구 채팅 테이블(임시)
create table friendMessage(
num number primary key,
flnum number constraint friendMessage_flnum_nn not null,
content varchar2(1000) constraint friendMessage_flnum_nn not null,
updatedate date default sysdate,
constraint fk_friendMessage_flnum foreign key(flnum) references friendList(num)
);

--장바구니 테이블
create table shopBasket(
num number primary key,
id varchar2(20) constraint shopBasket_id_nn not null,
gdnum number constraint shopBasket_gdnum_nn not null, constraint shopBasket_gdnum_uni unique,
regidate date default sysdate,
constraint fk_shopBasket_id foreign key(id) references userinfo(id),
constraint fk_shopBasket_gdnum foreign key(gdnum) references gameDetail(num)
);

--관리자 설정 테이블
create table adminSetting(
bgfilepath varchar2(50),
logofilepath varchar2(50),
regiCharge number,
buyCharge number
);

--방문자수 테이블
create table visitCount(
visitDate date default sysdate primary key,
visitValue number default 0 constraint visitCount_visitValue_nn not null
);

--판매자 - 판매현황 및 수익 테이블
create table compProfit(
num number primary key,
gdnum number,
dayRegiCharge number,
dayBuyCharge number,
dayBuyProfit number,
regidate date default sysdate
);


--게시판 테이블

-- 게시판 테이블 기본형 **부분에 해당 게시판명 적어야함 (CT테이블은 viewcnt 삭제해야함!)
create table board**(
num number primary key,
title varchar2(50) constraint board**_title_nn not null,
content varchar2(4000) constraint board**_content_nn not null,
writer varchar2(20) constraint board**_writer_nn not null,
regidate date default sysdate,
updatedate date default sysdate,
viewcnt number default 0,
filepath varchar2(50)
);

-- 게시판 댓글 테이블 기본형 ** 부분에 해당 게시판명 적어야함
create table board**Reply(
num number primary key,
**num number,
content varchar2(1000) constraint board**Reply_content_nn not null,
replyer varchar2(20) board**Reply_replyer_nn not null,
regidate date,
updatedate date,
constraint fk_board**Reply_**num foreign key(**num) references board**(num)
);

--자유게시판 									#191010 최진우 생성
create table boardFR(
num number primary key,
title varchar2(50) constraint boardFR_title_nn not null,
content varchar2(4000) constraint boardFR_content_nn not null,
writer varchar2(20) constraint boardFR_writer_nn not null,
regidate date default sysdate,
updatedate date default sysdate,
viewcnt number default 0,
filepath varchar2(50),
adminselect number default 0 constraint boardFR_adminselect_nn not null
);

--자유게시판 댓글 테이블
create table boardFRReply(
num number primary key,
FRnum number,
content varchar2(1000) constraint boardFRReply_content_nn not null,
replyer varchar2(20) boardFRReply_replyer_nn not null,
regidate date,
updatedate date,
constraint fk_boardFRReply_FRnum foreign key(FRnum) references boardFR(num)
);

-- 이벤트 게시판 테이블
create table boardEV(
num number primary key,
title varchar2(50) constraint boardEV_title_nn not null,
content varchar2(4000) constraint boardEV_content_nn not null,
writer varchar2(20) constraint boardEV_writer_nn not null,
regidate date default sysdate,
updatedate date default sysdate,
startdate date default sysdate,
enddate date constraint boardEV_enddate_nn not null,
viewcnt number default 0,
filepath varchar2(50),
adminselect number default 0 constraint boardEV_adminselect_nn not null
);

--이벤트 게시판 댓글 테이블
create table boardEVReply(
num number primary key,
EVnum number,
content varchar2(1000) constraint boardEVReply_content_nn not null,
replyer varchar2(20) boardEVReply_replyer_nn not null,
regidate date,
updatedate date,
constraint fk_boardEVReply_EVnum foreign key(EVnum) references boardEV(num)
);

--새소식 게시판 테이블
create table boardNG(
num number primary key,
title varchar2(50) constraint boardNG_title_nn not null,
content varchar2(4000) constraint boardNG_content_nn not null,
writer varchar2(20) constraint boardNG_writer_nn not null,
regidate date default sysdate,
updatedate date default sysdate,
viewcnt number default 0,
filepath varchar2(50),
adminselect number default 0 constraint boardNG_adminselect_nn not null
);

--새소식 게시판 댓글 테이블
create table boardNGReply(
num number primary key,
NGnum number,
content varchar2(1000) constraint boardNGReply_content_nn not null,
replyer varchar2(20) boardNGReply_replyer_nn not null,
regidate date,
updatedate date,
constraint fk_boardNGReply_NGnum foreign key(NGnum) references boardNG(num)
);

--공지 게시판 테이블
create table boardNT(
num number primary key,
title varchar2(50) constraint boardNT_title_nn not null,
content varchar2(4000) constraint boardNT_content_nn not null,
writer varchar2(20) constraint boardNT_writer_nn not null,
regidate date default sysdate,
updatedate date default sysdate,
viewcnt number default 0,
filepath varchar2(50),
adminselect number default 0 constraint boardNT_adminselect_nn not null
);

--공지 게시판 댓글 테이블
create table boardNTReply(
num number primary key,
NTnum number,
content varchar2(1000) constraint boardNTReply_content_nn not null,
replyer varchar2(20) boardNTReply_replyer_nn not null,
regidate date,
updatedate date,
constraint fk_boardNTReply_NTnum foreign key(NTnum) references boardNT(num)
);

--질문 답변 게시판 테이블
create table boardQNA(
num number primary key,
title varchar2(50) constraint boardQNA_title_nn not null,
content varchar2(4000) constraint boardQNA_content_nn not null,
viewcnt number default 0,
filepath varchar2(50)
);

--1:1 문의 게시판 테이블
create table boardCT(
num number primary key,
title varchar2(50) constraint boardCT_title_nn not null,
content varchar2(4000) constraint boardCT_content_nn not null,
writer varchar2(20) constraint boardCT_writer_nn not null,
regidate date default sysdate,
updatedate date default sysdate,
filepath varchar2(50)
);

--1:1문의 관리자 답변 테이블
create table boardCTAnswer(
num number primary key,
CTnum number constraint boardCTAnswer_CTnum_nn not null,
content varchar2(4000) constraint boardCTAnswer_content_nn not null,
regidate date default sysdate,
writer varchar2(20) constraint boardCTAnswer_writer_nn not null,
constraint fk_boardCTAnswer_CTnum foreign key(CTnum) references boardCT(num)
);
