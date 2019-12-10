drop database if exists szbbp_ods_tmp CASCADE;
create database if not exists szbbp_ods_tmp;

CREATE TABLE IF NOT EXISTS `szbbp_ods_tmp`.`us_order_tmp` (
    `order_id` bigint,
    `order_no` string,
    `order_date` timestamp,
    `user_id` bigint,
    `user_name` string,
    `order_money` decimal(18,2),
    `order_type` int,
    `order_status` int,
    `pay_status` int,
    `pay_type` int,
    `order_source` string,
    `update_time` timestamp
)
;

CREATE TABLE IF NOT EXISTS `szbbp_ods_tmp`.`order_item_tmp` (
    `user_id` bigint,
    `order_id` bigint,
    `order_no` string,
    `goods_id` bigint,
    `goods_no` string,
    `goods_name` string,
    `goods_amount` int,
    `shop_id` bigint,
    `shop_name` string,
    `curr_price` decimal(18,2),
    `market_price` decimal(18,2),
    `discount` decimal(18,2),
    `cost_price` decimal(18,2),
    `first_cart` bigint,
    `first_cart_name` string,
    `second_cart` bigint,
    `second_cart_name` string,
    `third_cart` bigint,
    `third_cart_name` string,
    `goods_desc` string,
    `update_time` timestamp
)
;

CREATE TABLE IF NOT EXISTS `szbbp_ods_tmp`.`order_delivery_tmp` (
    `order_id` bigint,
    `order_no` string,
    `consignee` string,
    `area_id` bigint,
    `area_name` string,
    `address` string,
    `mobile` bigint,
    `phone` string,
    `coupon_id` bigint,
    `coupon_money` decimal(18,2),
    `carriage_money` decimal(18,2),
    `create_time` string,
    `update_time` timestamp,
    `addr_id` bigint
)
;

CREATE TABLE IF NOT EXISTS `szbbp_ods_tmp`.`biz_trade_tmp` (
    `trade_id` bigint,
    `order_id` bigint,
    `user_id` bigint,
    `amount` decimal(18,2),
    `trade_type` tinyint,
    `trade_time` timestamp
)
;

--------------------------- cart --------------------------------
CREATE TABLE IF NOT EXISTS `szbbp_ods_tmp`.`cart_tmp` (
    `cart_id` bigint,
    `session_id` string,
    `user_id` bigint,
    `goods_id` bigint,
    `goods_num` int,
    `add_time` string,
    `cancle_time` string,
    `sumbit_time` timestamp,
    `create_date` string
)
;
