<?php
/**
 * Created by PhpStorm.
 * User: hirsi
 * Email: whuanxu@163.com
 * Github: https://github.com/Ninee
 * Date: 2019/4/29
 * Time: 10:51 AM
 */
define('URL', 'http://v2.api.guanyierp.com/rest/erp_open');
define('APPKEY', '112194');
define('SESSIONKEY', '50b24306aacf479a9a5651f0fc7cabc3');
define('SECRET', '7d3330562019420da7f3098aa630556b');

// getshops();
// getsupplier();
// getVip();
// getWarehouses();
// getGoods();
// getOrders();
// getDelivery();
// getNewStock();
// addGoods();
// updateGoods();
// deleteGoods();
// addSku();
// updateSku();
// deleteSku();
// getPurchase();
// getPurchaseArrives();
// getPurchaseReturns();
// getStockcounts();
// getStockTransfers();
// getTradeReturns();
// addInventory();
//addOrder();
// addTradeReturn();
// approveTradeReturn();
// updateOrderRefund();
// updateDelivery();
// addTraderefund();
// addAdjust();
// addTransfer();
// addPurchaseArrive();
// addnewPurchaseArrive();
// addnewPurchaseArriveapprove();
// addPurchaseArriveupdate();
// addPurchasereturn();
// updateOrderMemo();
// getItemBarcode();
// addItemBarcode();

//获取店铺信息
function getShops() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.shop.get';
    $data['page_no'] = '1';
    $data['page_size'] = '10';
    // $data['code'] = '001';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 供应商查询
function getsupplier() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.supplier.get';
    $data['page_no'] = '1';
    $data['page_size'] = '10';
    // $data['start_date'] = '2015-10-10 09:09:09';
    // $data['end_date'] = '2015-12-10 09:09:09';
    // $data['code'] = '001';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 会员查询
function getVip() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.vip.get';
    $data['page_no'] = '1';
    $data['page_size'] = '10';
    // $data['start_created'] = '2016-01-01 08:00:00';
    // $data['end_created'] = '2016-06-22 08:00:00';
    // $data['level_code'] = '02';
    // $data['shop_code'] = 'feiniu';
    // $data['code'] = '18662591592';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

//获取仓库信息
function getWarehouses() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.warehouse.get';
    $data['page_no'] = '1';
    $data['page_size'] = '10';
    // $data['code'] = '001';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 商品查询
function getGoods() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.items.get';
    $data['page_no'] = '1';
    $data['page_size'] = '10';
    // $data['code'] = 'ZZLN000005';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

//获取订单
function getOrders() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.trade.get';
    $data['page_no'] = '1';
    $data['page_size'] = '10';
    $data['start_date'] = '2015-8-1 09:06:01';
    $data['end_date'] = '2016-1-27 09:06:01';
    $data['date_type'] = 0;
    $data['order_state'] = 0;
    $data['warehouse_code'] = 'ck01';
    // $data['shop_code'] = '005';
    $data['platform_code'] = '1453793019';
    // $date['receiver_mobile']='15928552965';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

//获取发货单
function getDelivery() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.trade.deliverys.get';
    $data['page_no'] = '1';
    $data['page_size'] = '10';
    $data['start_create'] = '2015-10-1 09:06:01';
    $data['end_create'] = '2016-1-27 09:06:01';
    // $data['deliveryprint_begintime'] = '2015-8-1 09:06:01';
    // $data['deliveryprintend_time'] = '2016-1-27 09:06:01';
    // $data['start_delivery_date'] = '2015-8-1 09:06:01';
    // $data['end_delivery_date'] = '2016-1-27 09:06:01';
    // $data['outer_code'] = '110';
    // $data['warehouse_code'] = 'ck01';
    // $data['shop_code'] = 'cj02';
    // $data['delivery'] = '1';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 获取库存（新）
function getNewStock() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.new.stock.get';
    $data['page_no'] = '1';
    $data['page_size'] = '10';
    $data['start_date'] = '2015-11-03 16:06:03';
    $data['end_date'] = '2015-11-04 10:06:03';
    // $data['barcode'] = '6921314113412';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

//新增商品
function addGoods() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.item.add';
    $random_code = time(); //获取当前时间戳，以时间戳做商品代码可以防止重复，避免出错，此方式仅为测试
    $data['code'] = $random_code;
    $data['name'] = '测试商品';
    $data['simple_name'] = '测试商品简称';
    $data['weight'] = '124.00';
    $skus = array();
    $skus[] = array(
        'sku_code' => $random_code . '011',
        'sku_name' => '红色 S',
        'sku_sales_price' => '12.00',
        'sku_note' => ''
    );
    $skus[] = array(
        'sku_code' => $random_code . '012',
        'sku_name' => '红色 M',
        'sku_sales_price' => '12.00',
        'sku_note' => ''
    );
    $data['skus'] = $skus;
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 商品修改
function updateGoods() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.item.update';
    $data['id'] = '11589572901';
    // $data['code'] = 'YUIOKLO';
    // $data['name'] = 'change_';
    // $data['simple_name'] = 'change_...';
    // $data['category_code'] = 'change_';
    // $data['supplier_code'] = '002';
    // $data['stock_status_code'] = '02';
    // $data['weight'] = '6000';
    // $data['unit_code'] = '002';
    // $data['sales_point'] = 'sales_point';
    // $data['package_point'] = '61';
    // $data['purchase_price'] = '160';
    // $data['sales_price'] = '161';
    // $data['agent_price'] = '162';
    // $data['cost_price'] = '163';
    // $data['note'] = 'test...';
    $skus = array();
    $skus[] = array(
        'sku_id' => '11589572902',
        'sku_code' => '规格wwwwwwwwwww',
        'sku_weight' => '70800',
        'sku_purchase_price' => '71',
        'sku_sales_price' => '72',
        'sku_agent_price' => '72',
        'sku_cost_price' => '73',
        'sku_package_point' => '7',
        'sku_sales_point' => '8',
        'sku_note' => 'haha'
    );
    // $skus[] = array(
    //     'sku_id' => '17392138451',
    //     'sku_code' => '规格wwwwwwwwwww',
    //     'sku_weight' => '70800',
    //     'sku_purchase_price' => '71',
    //     'sku_sales_price' => '72',
    //     'sku_agent_price' => '72',
    //     'sku_cost_price' => '73',
    //     'sku_package_point' => '7',
    //     'sku_sales_point' => '8',
    //     'sku_note' => 'haha'
    // );
    $data['skus'] = $skus;
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 商品删除
function deleteGoods() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.item.delete';
    $data['page_no'] = '1';
    $data['page_size'] = '10';
    // $data['code'] = '001';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 商品规格增加
function addSku() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.item.sku.add';
    $data['item_id'] = '17391916228';
    $data['code'] = '143330110673603';
    $data['name'] = '规格3';
    $data['stock_status_code'] = '01';
    $data['weight'] = '1000';
    $data['sales_point'] = '10';
    $data['package_point'] = '11';
    $data['purchase_price'] = '10';
    $data['sales_price'] = '10';
    $data['agent_price'] = '162';
    $data['cost_price'] = '163';
    $data['note'] = '1.0000';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 商品规格修改
function updateSku() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.item.sku.update';
    $data['item_id'] = '17391916228';
    // $data['id'] = '17391916228';
    // $data['code'] = '143330110673603';
    $data['name'] = '规格3';
    $data['stock_status_code'] = '01';
    $data['weight'] = '1000';
    $data['sales_point'] = '10';
    $data['package_point'] = '11';
    $data['purchase_price'] = '10';
    $data['sales_price'] = '10';
    $data['agent_price'] = '162';
    $data['cost_price'] = '163';
    $data['note'] = '1.0000';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 商品规格删除
function deleteSku() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.item.sku.delete';
    $data['item_id'] = '17391916228';
    $data['id'] = '1739213845111';
    // $data['code'] = '143330110673602';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 获取采购订单
function getPurchase() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.purchase.get';
    $data['page_no'] = '1';
    $data['page_size'] = '10';
    $data['code'] = 'PO4298914535';
    $data['status'] = '0';
    // $data['start_create_date'] = '2015-07-03 15:51:01';
    // $data['end_create_date'] = 'PO4298914535';
    // $data['start_approve_date'] = '2015-07-03 15:51:32';
    // $data['end_approve_date'] = '2015-07-16 17:52:05';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 获取采购入库单
function getPurchaseArrives() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.purchase.arrive.get';
    $data['page_no'] = '1';
    $data['page_size'] = '10';
    $data['code'] = 'PAO451284351';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 获取采购退货单
function getPurchaseReturns() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.purchase.return.get';
    $data['page_no'] = '1';
    $data['page_size'] = '10';
    // $data['warehouse_code'] = 'ck02';
    // $data['code'] = 'PAO451284351';
    $data['status'] = 1;
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 获取盘点单
function getStockcounts() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.stock.count.get';
    $data['page_no'] = '1';
    $data['page_size'] = '10';
    // $data['code'] = 'WCO7171989147';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 获取调拨单
function getStockTransfers() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.stock.transfer.get';
    $data['page_no'] = '1';
    $data['page_size'] = '10';
    // $data['code'] = 'WTO4244996172';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 获取退换货单
function getTradeReturns() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.trade.return.get';
    $data['page_no'] = '1';
    $data['page_size'] = '10';
    $data['code'] = 'WTO4244996172';
    $data['warehousein_code'] = '001';
    $data['shop_code'] = '111';
    // $data['in_begin_time'] = '2015-02-06 00:00:00';
    $data['receive'] = '1';
    $data['agree'] = '1';
    $data['cancel'] = '2';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 新增盘点单
function addInventory() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.stock.count.add';
    $data['type_code'] = '003';
    $data['warehouse_code'] = 'CK01';
    $data['note'] = 'test inventory..';
    $details = array();
    $details[] = array(
        'item_code' => 'TTTT',
        // 'sku_code' => '红色 S',
        'qty' => 1,
        'note' => 'good1'
    );
    // $details[] = array(
    //   'item_code' => 'TTTT',
    //     // 'sku_code' => '红色 S',
    //     'qty' => 1,
    //     'note' => 'good1'
    // );
    $data['details'] = $details;
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

//新增订单
function addOrder() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.trade.add';
    $data['order_type_code'] = 'Sales';
    $data['refund'] = 0;
    $data['warehouse_code'] = 'CK001';
    $data['cod'] = false;
    $data['shop_code'] = 'CJ001';
    $data['express_code']= 'sto';
    $random_code = time(); //获取当前时间戳，以时间戳做平台单号可以防止重复，避免出错，此方式仅为测试
    $data['platform_code'] = $random_code;
    $data['deal_datetime'] = '2015-11-13 14:39:23';
    $data['pay_datetime'] = '2015-09-09 10:47:00';
    $data['post_fee'] = 0;
    $data['cod_fee'] = 0;
    $data['discount_fee'] = 0;
    $data['tag_code'] = '1';
    $data['plan_delivery_date'] = '2015-09-09 10:47:01';
    $data['vip_code'] = 'guqilong';
    $data['buyer_memo'] = 'buyer_memo';
    $data['seller_memo'] = 'seller_memo+%$#@!~^late';
    $data['seller_memo_late'] = '二次备注seller_memo+%$#@!~^lat';
    $data['receiver_name'] = '张越';
    $data['receiver_phone'] = '';
    $data['receiver_mobile'] = '15928552965';
    $data['receiver_address'] = '校园路一号绵世溪地湾4栋2306（犀浦西南交大旁）';
    $data['receiver_province'] = '安徽省';
    $data['receiver_city'] = '安徽省';
    $data['receiver_district'] = '高新技术产业开发区';
    $data['vipRealName'] = '仔仔';
    $data['vipIdCard'] = '71314141333331318831';
    $data['vipEmail'] = 'd11111d@qq.com';
    $details = array();
    $details[] = array(
        'item_code' => 'A002',
        'sku_code' => 'A002012',
        'price' => 9.99,
        'qty' => 2,
        'refund' => 0
    );
    //  $details[] = array(
    //     'item_code' => 'A002',
    //     'sku_code' => 'A002012',
    //     'price' => 9.99,
    //     'qty' => 2,
    //     'refund' => 0
    // );
    $data['details'] = $details;
    $payments = array();
    $payments[] = array(
        'pay_type_code' => 'zhifubao',
        'payment' => 22.03,
        'pay_code' => 9.99,
        'paytime' => $random_code*1000
    );
    $data['payments'] = $payments;
    $invoices = array();
    $invoices[] = array(
        'invoice_type' => 1,
        'invoice_title' => '上海管易云计算软件有限公司kkkkk',
        'invoice_content' => '明细',
        'invoice_amount' => '88.90'
    );
    $data['invoices'] = $invoices;
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

//新增退货单
function addTradeReturn() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.trade.return.add';
    $data['type_code'] = '001';
    $data['vip_code'] = 'test';
    $data['shop_code'] = '004';
    $data['note'] = 'thisistrade_return';
    // $data['trade_platform_code'] = '2015100901211341';
    $data['trade_code'] = 'SO12386172818';
    $item_detail = array();
    $item_detail[] = array(
        'item_code' => 'TTTT',
        // 'sku_code' => '红色 S',
        'qty' => 1,
        'originPrice' => '21.00',
        'price' => '10.00',
        'note' => 'good1'
    );
    $item_detail[] = array(
        'item_code' => 'TTTT',
        // 'sku_code' => '红色 S',
        'qty' => 1,
        'originPrice' => '21.00',
        'price' => '10.00',
        'note' => 'good1'
    );
    $data['item_detail'] = $item_detail;
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

//入库退货单
function approveTradeReturn() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.trade.return.approve';
    $data['code'] = 'RGO6999332255';
    $data['warehouse_code'] = 'CK02';
    $data['express_code'] = 'STO';
    $data['express_no'] = '681989898989';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

//更新订单退款状态
function updateOrderRefund() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.trade.refund.update';
    $data['tid'] = '201510CP15100166';
    $data['oid'] = '201510CP15100166201507CG290000074';
    $data['refund_state'] = 1;
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

//发货单修改（回写物流信息及订单状态）
function updateDelivery() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.trade.deliverys.update';
    $data['code'] = 'SDO11915496068';
    $data['express_code'] = 'STO';
    $data['mail_no'] = '213141';
    $deliverys_state_paramlist = array();
    $deliverys_state_paramlist[] = array(
        'area_id' => '0',
        'operator' => 'test',
        'operator_date' => '2015-01-09 11:11:11',
        'sku_note' => ''
    );
    $deliverys_state_paramlist[] = array(
        'area_id' => '1',
        'operator' => 'test1',
        'operator_date' => '2015-01-09 11:11:11',
        'sku_note' => ''
    );
    $data['deliverys_state_paramlist'] = $deliverys_state_paramlist;
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 新增退款单
function addTraderefund() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.trade.refund.add';
    $data['refund_code'] = '45685456231';// 退款单号
    $data['refund_type'] = 0;
    $data['trade_code'] = 'SO11931230506';// 銷售订单号
    $data['shop_code'] = '2';
    $data['payment_type_code'] = 'zhifubao';
    $data['amount'] = '100';
    $data['note'] = '2015100901211341';
    $item_detail = array();
    $item_detail[] = array(
        'barcode' => '6921314113412',
        'qty' => 2,
        'price' => '12.00',
        'note' => 'good1!@#$%'
    );
    // $item_detail[] = array(
    //     'barcode' => '6921314113412',
    //     'qty' => 2,
    //     'price' => '12.00',
    //     'note' => 'good1!@#$%'
    // );
    $data['item_detail'] = $item_detail;
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 新增调整单
function addAdjust() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.stock.adjust.add';
    $data['warehouse_code'] = 'CK02';
    $data['order_type'] = '001';
    $data['note'] = '001';
    $data['operator'] = 'xiaozhang';
    $detailList = array();
    $detailList[] = array(
        'item_code' => 'test',
        'sku_code' => 'test',
        'qty' => 2,
        'note' => 'good1!@#$%'
    );
    // $detailList[] = array(
    // 'item_code' => 'test',
    // 'sku_code' => 'test',
    // 'qty' => 2,
    // 'note' => 'good1!@#$%'
    // );
    $data['detailList'] = $detailList;
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 新增调拨单
function addTransfer() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.stock.transfer.add';
    $data['warehouse_in_code'] = 'ck01';
    $data['warehouse_out_code'] = 'ck02';
    $data['order_type'] = '01';
    $data['note'] = '001';
    // $data['operator'] = 'xiaozhang';
    $detailList = array();
    $detailList[] = array(
        'item_code' => 'test',
        'sku_code' => 'test',
        'qty' => 2,
        'note' => 'good1!@#$%'
    );
    // $detailList[] = array(
    // 'item_code' => 'test',
    // 'sku_code' => 'test',
    // 'qty' => 2,
    // 'note' => 'good1!@#$%'
    // );
    $data['detailList'] = $detailList;
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 新增采购入库单
function addPurchaseArrive() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.purchase.arrive.add';
    $data['warehouse_code'] = 'ck01';
    $data['supplier_code'] = '001';
    $data['order_type'] = '01';
    $data['purchase_code'] = 'PO14971849911';
    // $data['note'] = 'test..';
    $detailList = array();
    $detailList[] = array(
        'item_code' => 'test',
        'sku_code' => 'test',
        'qty' => 2,
        'price' => '50000',
        'note' => 'good1!@#$%'
    );
    // $detailList[] = array(
    // 'item_code' => 'test',
    // 'sku_code' => 'test',
    // 'qty' => 2,
    // 'price' => '50000',
    // 'note' => 'good1!@#$%'
    // );
    $data['detailList'] = $detailList;
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 新增采购入库单(新)
function addnewPurchaseArrive() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.new.purchase.arrive.add';
    $data['warehouse_code'] = 'ck01';
    $data['supplier_code'] = '001';
    $data['order_type'] = '001';
    $data['purchase_code'] = 'PO14971849911';
    $data['ex_cost'] = '70';
    // $data['note'] = 'test..';
    $detaillist = array();
    $detaillist[] = array(
        'barcode' => '185632165',
        'qty' => 2,
        'price' => '50000',
        'note' => 'good1!@#$%'
    );
    // $detaillist[] = array(
    // 'barcode' => 'test',
    // 'qty' => 2,
    // 'price' => '50000',
    // 'note' => 'good1!@#$%'
    // );
    $data['detail_list'] = $detaillist;
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 采购入库单审核
function addnewPurchaseArriveapprove() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.new.purchase.arrive.approve';
    $data['code'] = 'PAO11588070248';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 采购入库单修改
function addPurchaseArriveupdate() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.purchase.arrive.update';
    $data['code'] = 'PAO7820587793';
    $data['type_code'] = '001';
    $data['warehouse_code'] = 'ck01';
    $data['note'] = 'test..';
    $item_detail = array();
    $item_detail[] = array(
        'barcode' => '185632165',
        'qty' => 2,
        'origin_price' => '50000',
        'price' => '50000',
        'note' => 'good1!@#$%'
    );
    // $item_detail[] = array(
    // 'barcode' => '185632165',
    // 'qty' => 2,
    // 'origin_price' => '50000',
    // 'price' => '50000',
    // 'note' => 'good1!@#$%'
    // );
    $data['item_detail'] = $item_detail;
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 采购退货单新增
function addPurchasereturn() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.purchase.return.add';
    $data['warehouse_code'] = 'ck01';
    $data['supplier_code'] = '001';
    $data['type_code'] = '001';
    $data['ex_cost'] = '70';
    $data['note'] = 'test..';
    $detail_list = array();
    $detail_list[] = array(
        'item_code' => 'dt',
        'sku_code' => 'dt01',
        'qty' => 2,
        'price' => '50000',
        'note' => 'good1!@#$%'
    );
    // $detail_list[] = array(
    // 'item_code' => 'dt',
    // 'sku_code' => 'dt01',
    // 'qty' => 2,
    // 'price' => '50000',
    // 'note' => 'good1!@#$%'
    // );
    $data['detail_list'] = $detail_list;
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 更新订单备注
function updateOrderMemo() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.trade.memo.update';
    $data['tid'] = '69456325698984964135';
    $data['memo'] = '请配仓:罗湖太宁路,距离：20.62。111';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 获取商品条码
function getItemBarcode() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.item.barcode.get';
    $data['page_no'] = '1';
    $data['page_size'] = '10';
    // $data['barcode'] = '661313146666663348';
    // $data['item_code'] = 'gytest001_mary';
    // $data['sku_code'] = '22211';
    // $data['start_date'] = '2015-08-28 16:30:00';
    // $data['end_date'] = '2015-08-28 18:00:00';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

// 新增商品条码
function addItemBarcode() {
    $data = array();
    $data['appkey'] = APPKEY;
    $data['sessionkey'] = SESSIONKEY;
    $data['method'] = 'gy.erp.item.barcode.add';
    $data['item_code'] = 'SSSSSSSSS';
    $data['sku_code'] = '201512CG140000065';
    $data['barcode'] = '185632165adsa';
    $data['sign'] = sign($data, SECRET);
    echo 'response: ' . mycurl(URL, $data);
}

function mycurl($url, $data) {
    $data_string = json_encode_ch($data);
    echo 'request: ' . $data_string . "\n";
    $data_string = urlencode($data_string);
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        'Content-Type:text/json;charset=utf-8',
        'Content-Length:' . strlen($data_string)
    ));
    $content = curl_exec($ch);
    curl_close($ch);
    return $content;
}

function sign($data, $secret) {
    if (empty($data)) {
        return "";
    }
    unset($data['sign']); //可选，具体看传参
    $data = json_encode_ch($data);
    $sign = strtoupper(md5($secret . $data . $secret));
    return $sign;
}

function json_encode_ch($arr) {
    return urldecode(json_encode(url_encode_arr($arr)));
}

function url_encode_arr($arr) {
    if (is_array($arr)) {
        foreach ($arr as $k => $v) {
            $arr[$k] = url_encode_arr($v);
        }
    } elseif (!is_numeric($arr) && !is_bool($arr)) {
        $arr = urlencode($arr);
    }
    return $arr;
}