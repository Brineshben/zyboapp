class BannerModel {
  int? id;
  Product? product;
  Category? category;
  String? name;
  String? image;
  int? showingOrder;
  bool? isActive;

  BannerModel(
      {this.id,
        this.product,
        this.category,
        this.name,
        this.image,
        this.showingOrder,
        this.isActive});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    category = json['category'] != null ? new Category.fromJson(json['category']) : null;
    name = json['name'];
    image = json['image'];
    showingOrder = json['showing_order'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['name'] = this.name;
    data['image'] = this.image;
    data['showing_order'] = this.showingOrder;
    data['is_active'] = this.isActive;
    return data;
  }
}

class Product {
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
  String? variationName;
  int? category;
  int? taxRate;

  Product(
      {this.id,
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
        this.variationName,
        this.category,
        this.taxRate});

  Product.fromJson(Map<String, dynamic> json) {
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
class Category {
  int? id;
  String? name;
  String? image;
  bool? isActive;
  int? showingOrder;
  String? slug;
  List<Products>? products;
  // Null? hexcode1;
  // Null? hexcode2;

  Category(
      {this.id,
        this.name,
        this.image,
        this.isActive,
        this.showingOrder,
        this.slug,
        this.products});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    isActive = json['is_active'];
    showingOrder = json['showing_order'];
    slug = json['slug'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['is_active'] = this.isActive;
    data['showing_order'] = this.showingOrder;
    data['slug'] = this.slug;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  List<Variations>? variations;
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
  // Null? showingOrder;
  String? variationName;
  int? category;
  int? taxRate;

  Products(
      {this.id,
        this.variations,
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
        this.variationName,
        this.category,
        this.taxRate});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
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
    variationName = json['variation_name'];
    category = json['category'];
    taxRate = json['tax_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
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
    data['variation_name'] = this.variationName;
    data['category'] = this.category;
    data['tax_rate'] = this.taxRate;
    return data;
  }
}

class Variations {
  int? id;
  int? salePrice;
  String? variationName;
  String? featuredImage;
  int? stock;
  String? created;
  bool? showStatus;
  int? showingOrder;
  int? product;

  Variations(
      {this.id,
        this.salePrice,
        this.variationName,
        this.featuredImage,
        this.stock,
        this.created,
        this.showStatus,
        this.showingOrder,
        this.product});

  Variations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    salePrice = json['sale_price'];
    variationName = json['variation_name'];
    featuredImage = json['featured_image'];
    stock = json['stock'];
    created = json['created'];
    showStatus = json['show_status'];
    showingOrder = json['showing_order'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sale_price'] = this.salePrice;
    data['variation_name'] = this.variationName;
    data['featured_image'] = this.featuredImage;
    data['stock'] = this.stock;
    data['created'] = this.created;
    data['show_status'] = this.showStatus;
    data['showing_order'] = this.showingOrder;
    data['product'] = this.product;
    return data;
  }
}
