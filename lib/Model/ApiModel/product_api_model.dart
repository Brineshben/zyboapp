class ProductListModel {
  int? length;
  int? id;
  // List<Null>? variations;
  bool? inWishlist;
  int? avgRating;
  List<String>? images;
  bool? variationExists;
  int? salePrice;
  List<Addons>? addons;
  bool? available;
  String? availableFrom;
  String? availableTo;
  String? name;
  String? description;
  String? caption;
  String? featuredImage;
  int? mrp;
  int? stock;
  bool? isActive;
  String? discount;
  String? createdDate;
  String? productType;
  String? showingOrder;
  String? variationName;
  int? category;
  int? taxRate;

  ProductListModel(
      {this.id,
        this.length,
        // this.variations,
        this.inWishlist,
        this.avgRating,
        this.images,
        this.variationExists,
        this.salePrice,
        this.addons,
        this.available,
        this.availableFrom,
        this.availableTo,
        this.name,
        this.description,
        this.caption,
        this.featuredImage,
        this.mrp,
        this.stock,
        this.isActive,
        this.discount,
        this.createdDate,
        this.productType,
        this.showingOrder,
        this.variationName,
        this.category,
        this.taxRate});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // if (json['variations'] != null) {
    //   variations = <Null>[];
    //   json['variations'].forEach((v) {
    //     variations!.add(new Null.fromJson(v));
    //   });
    // }
    inWishlist = json['in_wishlist'];
    avgRating = json['avg_rating'];
    images = json['images'].cast<String>();
    variationExists = json['variation_exists'];
    salePrice = json['sale_price'];
    if (json['addons'] != null) {
      addons = <Addons>[];
      json['addons'].forEach((v) {
        addons!.add(new Addons.fromJson(v));
      });
    }
    available = json['available'];
    availableFrom = json['available_from'];
    availableTo = json['available_to'];
    name = json['name'];
    description = json['description'];
    caption = json['caption'];
    featuredImage = json['featured_image'];
    mrp = json['mrp'];
    stock = json['stock'];
    isActive = json['is_active'];
    discount = json['discount'];
    createdDate = json['created_date'];
    productType = json['product_type'];
    showingOrder = json['showing_order'];
    variationName = json['variation_name'];
    category = json['category'];
    taxRate = json['tax_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    // if (this.variations != null) {
    //   data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    // }
    data['in_wishlist'] = this.inWishlist;
    data['avg_rating'] = this.avgRating;
    data['images'] = this.images;
    data['variation_exists'] = this.variationExists;
    data['sale_price'] = this.salePrice;
    if (this.addons != null) {
      data['addons'] = this.addons!.map((v) => v.toJson()).toList();
    }
    data['available'] = this.available;
    data['available_from'] = this.availableFrom;
    data['available_to'] = this.availableTo;
    data['name'] = this.name;
    data['description'] = this.description;
    data['caption'] = this.caption;
    data['featured_image'] = this.featuredImage;
    data['mrp'] = this.mrp;
    data['stock'] = this.stock;
    data['is_active'] = this.isActive;
    data['discount'] = this.discount;
    data['created_date'] = this.createdDate;
    data['product_type'] = this.productType;
    data['showing_order'] = this.showingOrder;
    data['variation_name'] = this.variationName;
    data['category'] = this.category;
    data['tax_rate'] = this.taxRate;
    return data;
  }
}

class Addons {
  int? id;
  int? price;
  String? name;
  String? description;
  String? featuredImage;
  int? stock;
  bool? isActive;
  int? taxRate;

  Addons(
      {this.id,
        this.price,
        this.name,
        this.description,
        this.featuredImage,
        this.stock,
        this.isActive,
        this.taxRate});

  Addons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    name = json['name'];
    description = json['description'];
    featuredImage = json['featured_image'];
    stock = json['stock'];
    isActive = json['is_active'];
    taxRate = json['tax_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['name'] = this.name;
    data['description'] = this.description;
    data['featured_image'] = this.featuredImage;
    data['stock'] = this.stock;
    data['is_active'] = this.isActive;
    data['tax_rate'] = this.taxRate;
    return data;
  }
}