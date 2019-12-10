use szbap_ods;


DELIMITER $$

USE `szbap_ods`$$

DROP PROCEDURE IF EXISTS `usp_create_user_withorder`$$

CREATE DEFINER=`root`@`%` PROCEDURE `usp_create_user_withorder`(row_cnt INT)
BEGIN
  SET @rn=1;
  WHILE(@rn<=row_cnt) DO
  SET @user_name = rand_user_name(6);
  SET @user_gender = rand_gender();
  SET @user_birthday = rand_date('1960-1-1');
  SET @user_age = get_age(@user_birthday);
  SET @constellation = get_constellation(@user_birthday);
  SET @city = '';
  WHILE @city ='' OR @city IS NULL DO
  SELECT city,province,id INTO @city,@province,@city_id FROM code_city WHERE id= FLOOR(1+RAND()*337) LIMIT 1;
  END WHILE;
  SET @city_level=FLOOR(1+RAND()*4);
  SET @e_mail='';
  WHILE @e_mail = '' DO
  SELECT CONCAT(@user_name,suffix),op_mail INTO @e_mail,@op_mail FROM code_email_suffix WHERE id=FLOOR(1+RAND()*15) LIMIT 1;
  END WHILE;
  SET @mobile = rand_mobile();
  SET @num_seg_mobile = SUBSTRING(@mobile,1,3);
  SET @op_Mobile='中国';
  SET @register_time= rand_date('2018-1-1');
  SET @login_ip=rand_ip();
  SET @login_source='https://www.ele.me/home/';
  SET @request_user='';
  SET @total_score=100;
  SET @used_score=0;
  SET @is_blacklist=0;
  SET @is_married=(CASE WHEN @age>25 THEN 1 ELSE 0 END);
  SELECT edu_name INTO @education FROM code_education WHERE id= FLOOR(1+RAND()*7) LIMIT 1;
  SET @monthly_income =FLOOR(20000+RAND()*80000);
  SELECT pro_name INTO @profession FROM code_profession WHERE id=FLOOR(1+RAND()*4) LIMIT 1;
  INSERT INTO `szbap_ods`.`user`
  (
    `user_name`,
    `user_gender`,
    `user_birthday`,
    `user_age`,
    `constellation`,
    `province`,
    `city`,
    `city_level`,
    `e_mail`,
    `op_mail`,
    `mobile`,
    `num_seg_mobile`,
    `op_Mobile`,
    `register_time`,
    `login_ip`,
    `login_source`,
    `request_user`,
    `total_score`,
    `used_score`,
    `is_blacklist`,
    `is_married`,
    `education`,
    `monthly_income`,
    `profession`,
    `create_date`
  )
  SELECT
    @user_name,
    @user_gender,
    @user_birthday,
    @user_age,
    @constellation,
    @province,
    @city,
    @city_level,
    @e_mail,
    @op_mail,
    @mobile,
    @num_seg_mobile,
    @op_Mobile,
    @register_time,
    @login_ip,
    @login_source,
    @request_user,
    @total_score,
    @used_score,
    @is_blacklist,
    @is_married,
    @education,
    @monthly_income,
    @profession,
    NOW();
  -- 获取插入的用户id
  SET @addr_rn= 1;
  SET @user_id=LAST_INSERT_ID();
  WHILE @addr_rn<=3 DO
  SET @addr=CONCAT(@province,@city,FLOOR((1+RAND()*1000)),'号');
  -- 插入用户的地址，每条插3条
  INSERT INTO user_addr(user_id,order_addr,user_order_flag,arear_id)
  VALUES (@user_id,@addr,@addr_rn,@city_id);
  SET @addr_rn = @addr_rn+1;
  END WHILE;
  -- 插入用户的扩展信息
  INSERT INTO `szbap_ods`.`user_extend`
  (`user_id`,
   `user_gender`,
   `is_pregnant_woman`,
   `is_have_children`,
   `is_have_car`,
   `phone_brand`,
   `phone_brand_level`,
   `phone_cnt`,
   `change_phone_cnt`,
   `is_maja`,
   `majia_account_cnt`,
   `loyal_model`,
   `shopping_type_model`,
   `weight`,
   `height`
  )
  SELECT
    @user_id,
    @user_gender,
    0 is_pregnant_woman,
    0 is_have_children,
    0 is_have_car,
    '华为' phone_brand,
    '一级'phone_brand_level,
    1 phone_cnt,
    3 change_phone_cnt,
    0 is_maja,
    0 majia_account_cnt,
    '高度' loyal_model,
    '理智消费用户' shopping_type_model,
    80+RAND()*200 weight,
    120+RAND()*200 height;
  CALL usp_user_order_init(@user_id);
  CALL us_create_visit_log(@user_id);
  SET @rn = @rn+1;
  END WHILE;
END$$

DELIMITER ;

call usp_create_user_withorder(100);