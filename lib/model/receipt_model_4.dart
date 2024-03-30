import 'package:objectbox/objectbox.dart';
import 'package:receipt_scanner/model/discount_model.dart';

@Entity()
class ReceiptModel4 {
  int id = 0;
  String newid;
  String cashierId;
  String cashierName;
  int date;
  bool isRefund;
  double totalPrice;
  bool uploaded;
  bool rejected;
  String clientName;
  String clientPhone;
  int cashback;
  double sdacha;
  String returnForCheck;
  String posName;
  double? zdachiToCashback;
  String? refundInfo;
  String? commissionTIN;
  bool hasClick = false;
  bool hasUzum = false;
  bool hasPayme = false;
//===========================
  String? terminalId;
  int? receiptSeq;
  int? dateTimeOFD;
  String? fiscalSign;
  String orderId;
  String createdDate;
  String cashboxId;
  String externalId;
  String clientId;
  String discountID;
  double discountVat;
  String orderType;
  String shopId;
  final soldItemList = ToMany<ReceiptModelSoldItem4>();
  final payment = ToMany<ReceiptModelPaymentType4>();
  bool? isDonate;
  ReceiptModel4({
    required this.createdDate,
    required this.orderId,
    required this.cashboxId,
    required this.externalId,
    required this.orderType,
    required this.shopId,
    required this.discountVat,
    required this.discountID,
    this.terminalId,
    this.receiptSeq,
    this.dateTimeOFD,
    this.fiscalSign,
    this.zdachiToCashback,
    required this.newid,
    required this.cashierId,
    required this.cashierName,
    required this.date,
    required this.isRefund,
    required this.totalPrice,
    required this.uploaded,
    required this.rejected,
    required this.clientName,
    required this.clientPhone,
    required this.clientId,
    required this.cashback,
    required this.sdacha,
    required this.returnForCheck,
    required this.posName,
    this.refundInfo,
    this.commissionTIN,
    this.hasClick = false,
    this.hasUzum = false,
    this.hasPayme = false,
    required this.isDonate,
  });
  thePayment() => payment;

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> paymentJsonList = [];
    List<Map<String, dynamic>> soldItemJsonList = [];

    for (var e in payment) {
      paymentJsonList.add(e.toJson());
    }
    for (var e in soldItemList) {
      e.orderId = orderId;
      soldItemJsonList.add(e.toJson());
    }

    Map<String, dynamic> json = {
      // 'phone_number': clientPhone,
      // 'client_id': newid,
      // "cashback_phone": clientPhone,
      // "cashier_id": cashierId,
      // "cashier_name": cashierName,
      // "date": date,
      // "is_refund": isRefund,
      // "is_self": true,
      // "service_value": 0,
      // "total_price": totalPrice,
      // "user_id": 10,
      // "point_balance": 11611,
      // "currency": "uzs",
      // "zdachi_to_cashback": zdachiToCashback ?? 0,
      // "refund_info": refundInfo,
      // "commissionTIN": commissionTIN,
      // "has_click": hasClick,
      // "has_uzum": hasUzum,
      // "has_payme": hasPayme,
      // 'is_donate': isDonate ?? false,
      ////////////////////////////////////////////////////////////////////////
      "terminal_id": terminalId,
      "receipt_seq": receiptSeq,
      "date_time": dateTimeOFD,
      "fiscal_sign": fiscalSign,
      "cashbox_id": cashboxId,
      "external_id": externalId,
      "client_id": clientId,
      "id": orderId,
      "order_type": "sale",
      "shop_id": shopId,
      "items": soldItemJsonList,
      "created_date": createdDate,
      "order_discount": {
        "order_id": orderId,
        "type": discountID,
        "value": discountVat,
      },
      "pays": {
        "order_id": orderId,
        "pays": paymentJsonList,
        "qr_code_url":
            "https://dev.cdn.7i.uz/file/31129fb7-b4cf-4df5-8b58-171c70ca33c4.html"
      },
    };
    return json;
  }

  Map<String, dynamic> toJsonForTest() {
    List<Map<String, dynamic>> paymentJsonList = [];
    List<Map<String, dynamic>> soldItemJsonList = [];

    for (var e in payment) {
      paymentJsonList.add(e.toJson());
    }
    for (var e in soldItemList) {
      e.orderId = orderId;
      soldItemJsonList.add(e.toJson());
    }

    Map<String, dynamic> json = {
      'phone_number': clientPhone,
      'client_id': newid,
      "cashback_phone": clientPhone,
      "cashier_id": cashierId,
      "cashier_name": cashierName,
      "date": date,
      "is_refund": isRefund,
      "is_self": true,
      "discount_id": discountID,
      "discount_vat": discountVat,
      "service_value": 0,
      "total_price": totalPrice,
      "user_id": 10,
      "point_balance": 11611,
      "currency": "uzs",
      "zdachi_to_cashback": zdachiToCashback ?? 0,
      "refund_info": refundInfo,
      "commissionTIN": commissionTIN,
      "has_click": hasClick,
      "has_uzum": hasUzum,
      "has_payme": hasPayme,
      'is_donate': isDonate ?? false,
      "terminal_id": terminalId,
      "receipt_seq": receiptSeq,
      "date_time": dateTimeOFD,
      "fiscal_sign": fiscalSign,
      "cashbox_id": cashboxId,
      "external_id": externalId,
      "id": orderId,
      "order_type": "sale",
      "shop_id": shopId,
      "items": soldItemJsonList,
      "created_date": createdDate,
      "order_discount": {
        "order_id": orderId,
        "type": "9a2aa8fe-806e-44d7-8c9d-575fa67ebefd",
        "value": 10
      },
      "pays": {
        "order_id": orderId,
        "pays": paymentJsonList,
        "qr_code_url":
            "https://dev.cdn.7i.uz/file/31129fb7-b4cf-4df5-8b58-171c70ca33c4.html"
      },
    };
    return json;
  }
}

@Entity()
class ReceiptModelPaymentType4 {
  int id = 0;
  String name;
  String payId;
  double value;

  ReceiptModelPaymentType4({
    required this.name,
    required this.payId,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      // "name": name,
      "payment_type_id": payId,
      "value": value,
    };
    return json;
  }
}

@Entity()
class ReceiptModelSoldItem4 {
//=============================
  final discount = ToMany<DiscountModel>();
  String orderId = "";
  String? refundItemId = "";
  double price;
  String barcode;
  String productId;
  String mxik;
  String productName;
  int sku;
  String sellerId;
  double cost;
  double? totalDiscountPrice;
  double value;
  String vatName;
  double vat;
  double vatPercent;
  String? packageCode;
  String? packageName;
  String? commissionTIN;
  bool isPriceChanged = false;
  int createdTime;
  int inBox;
  String? tin;
  bool marking;
  String? mark;
  bool? mxikError;
  double? discountPercent;
  bool? isDeleted;
  String soldBy;
  int id = 0;
  ReceiptModelSoldItem4({
    required this.inBox,
    this.isDeleted,
    this.commissionTIN,
    required this.tin,
    this.mxikError,
    required this.sellerId,
    required this.soldBy,
    this.totalDiscountPrice,
    required this.cost,
    required this.vatName,
    required this.createdTime,
    required this.price,
    required this.value,
    required this.productId,
    required this.productName,
    this.mark,
    this.refundItemId,
    this.marking = false,
    required this.barcode,
    required this.sku,
    required this.vatPercent,
    required this.vat,
    required this.mxik,
    this.discountPercent,
    this.isPriceChanged = false,
    this.packageCode,
    this.packageName,
  });

  // Map<String, dynamic> toJson() {
  //   List<Map<String, dynamic>> discounts = [];
  //   for (var e in discount) {
  //     discounts.add(e.toJson());
  //   }
  //   Map<String, dynamic> json = {
  //     "sold_by": soldBy,
  //     "cost": cost,
  //     "created_time": createdTime,
  //     "price_type": "P",
  //     "product_name": productName,
  //     "reset_count": 0.0,
  //     "value": value,
  //     "sold_item_type": "item",
  //     "taxes": [],
  //     "modifiers": [],
  //     "vat": vat,
  //     "vat_percent": vatPercent,
  //     "mxik": mxik,
  //     // "price_position": this.pricePosition,
  //     "discount": discounts,
  //     "marking": marking,
  //     "mark": mark,
  //     'package_code': packageCode,
  //     'package_name': packageName,
  //     "order_id": orderId,
  //     "price": price,
  //     "product_barcode": barcode,
  //     "product_id": productId,
  //     "product_mxik": mxik,
  //     "product_sku": sku,
  //     "seller_id": sellerId,
  //     "supply_price": cost,
  //     "total_discount_price": 0,
  //     "vat_name": vatName,
  //     "vat_percentage": vatPercent
  //   };

  //   // Log.j(json, name: 'receipt_model_4');

  //   // if (tin != null) {
  //   //   json['commissionTIN'] = tin;
  //   // }
  //   return json;
  // }
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> discounts = [];
    for (var e in discount) {
      discounts.add(e.toJson());
    }
    Map<String, dynamic> json = {
      "product_name": productName,
      "value": value,
      "order_id": orderId,
      // "price": price,
      "price": (vat * (100 + vatPercent)) / vatPercent,
      "product_barcode": barcode,
      "product_id": productId,
      "product_mxik": mxik,
      "product_sku": sku.toString(),
      "seller_id": sellerId,
      "total_discount_price": 0,
      "vat_name": vatName,
      "vat_percentage": vatPercent
    };

    // Log.j(json, name: 'receipt_model_4');

    // if (tin != null) {
    //   json['commissionTIN'] = tin;
    // }
    return json;
  }
}
