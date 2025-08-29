class GetAllSubscriptionResponseModel {
  var success;
  var message;
  List<GetAllSubscriptionResponse>? data;

  GetAllSubscriptionResponseModel({this.success, this.message, this.data});

  GetAllSubscriptionResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllSubscriptionResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllSubscriptionResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllSubscriptionResponse {
  var sId;
  var name;
  var maxUsers;
  var price;
  var interval;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var iV;
  var stripePriceId;
  var stripeProductId;

  GetAllSubscriptionResponse({
    this.sId,
    this.name,
    this.maxUsers,
    this.price,
    this.interval,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.stripePriceId,
    this.stripeProductId,
  });

  GetAllSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    maxUsers = json['max_users'];
    price = json['price'];
    interval = json['interval'];
    isDeleted = json['is_deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    stripePriceId = json['stripe_price_id'];
    stripeProductId = json['stripe_product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['max_users'] = this.maxUsers;
    data['price'] = this.price;
    data['interval'] = this.interval;
    data['is_deleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['stripe_price_id'] = this.stripePriceId;
    data['stripe_product_id'] = this.stripeProductId;
    return data;
  }
}
