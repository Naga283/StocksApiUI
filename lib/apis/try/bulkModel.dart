//@dart =2.9
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        this.data,
      this.status,
    });

    List<Datum> data;
    String status;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
        status: json["Status"],
    );

    Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
        "Status": status,
    };
}

class Datum {
    Datum({
         this.finCode,
          this.clientName,
         this.dealType,
         this.quantity,
        this.value,
        this.tradePrice,
      //  this.dealDate,
         this.exchange,
    });

    String finCode;
    String clientName;
    DealType dealType;
    String quantity;
    String value;
    String tradePrice;
  //  DateTime dealDate;
    Exchange exchange;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        finCode: json["FinCode"],
        clientName: json["ClientName"],
        dealType: dealTypeValues.map[json["DealType"]],
        quantity: json["Quantity"],
        value: json["Value"],
        tradePrice: json["TradePrice"],
       // dealDate: DateTime.parse(json["DealDate"]),
        exchange: exchangeValues.map[json["Exchange"]],
    );

    Map<String, dynamic> toJson() => {
        "FinCode": finCode,
        "ClientName": clientName,
        "DealType": dealTypeValues.reverse[dealType],
        "Quantity": quantity,
        "Value": value,
        "TradePrice": tradePrice,
      //  "DealDate": dealDate.toIso8601String(),
        "Exchange": exchangeValues.reverse[exchange],
    };
}

enum DealType { BUY, SELL }

final dealTypeValues = EnumValues({
    "BUY": DealType.BUY,
    "SELL": DealType.SELL
});

enum Exchange { BSE, NSE }

final exchangeValues = EnumValues({
    "BSE": Exchange.BSE,
    "NSE": Exchange.NSE
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}


