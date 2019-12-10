drop database if exists hzbbp_dim CASCADE;

create database if not exists szbbp_dim;

CREATE TABLE if not exists `szbbp_dim`.`dim_code_category` (
    `first_category_id` int,
    `first_category_name` string,
    `second_category_id` int,
    `second_catery_name` string,
    `third_category_id` int,
    `third_category_name` string,
    `category_id` int
)
;

CREATE TABLE if not exists `szbbp_dim`.`dim_code_city` (
    `id` int,
    `city` string,
    `province` string
)
;

CREATE TABLE if not exists `szbbp_dim`.`dim_code_education` (
    `id` int,
    `edu_name` string
)
;

CREATE TABLE if not exists `szbbp_dim`.`dim_code_email_suffix` (
    `id` int,
    `suffix` string,
    `op_mail` string
)
;

CREATE TABLE if not exists `szbbp_dim`.`dim_code_goods` (
    `first_category_id` int,
    `first_category_name` string,
    `second_category_id` int,
    `second_catery_name` string,
    `third_category_id` int,
    `third_category_name` string,
    `goods_id` int,
    `goods_name` string,
    `goods_no` int,
    `seller_id` int,
    `seller_name` string,
    `food_price` decimal(18,2)
)
;

--------------------------- code_profession --------------------------------
CREATE TABLE if not exists `szbbp_dim`.`dim_code_profession` (
    `id` int,
    `pro_name` string
)
;

CREATE TABLE if not exists `szbbp_dim`.`dim_code_shop` (
    `seller_id` int,
    `seller_name` string,
    `category_id` int
)
;






