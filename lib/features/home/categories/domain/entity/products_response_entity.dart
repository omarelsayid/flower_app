import 'package:equatable/equatable.dart';

/// message : "success"
/// metadata : {"currentPage":1,"totalPages":1,"limit":40,"totalItems":12}
/// products : [{"_id":"673e1cd711599201718280fb","title":"Wdding Flower","slug":"wdding-flower","description":"This is a Pack of White Widding Flowers","imgCover":"https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png","images":["https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png","https://flower.elevateegy.com/uploads/f27e1903-74cf-4ed6-a42c-e43e35b6dd14-image_three.png","https://flower.elevateegy.com/uploads/500fe197-0e16-4b01-9a0d-031ccb032714-image_two.png"],"price":440,"priceAfterDiscount":100,"quantity":3985,"category":"673c46fd1159920171827c85","occasion":"673b34c21159920171827ae0","createdAt":"2024-11-20T17:31:03.303Z","updatedAt":"2025-04-01T18:42:35.619Z","__v":0,"discount":50,"sold":677,"rateAvg":3.5,"rateCount":30,"id":"673e1cd711599201718280fb"},{"rateAvg":5,"rateCount":0,"_id":"673e2bd91159920171828139","title":"Red Wdding Flower","slug":"red-wdding-flower","description":"This is a Pack of Red Widding Flowers","imgCover":"https://flower.elevateegy.com/uploads/5452abf4-2040-43d7-bb3d-3ae8f53c4576-cover_image.png","images":["https://flower.elevateegy.com/uploads/ba028e59-410f-43ac-aed5-f4f97c102b98-image_four.png","https://flower.elevateegy.com/uploads/f89bc954-eb0d-4efb-928f-6717f77b69ed-image_one.png","https://flower.elevateegy.com/uploads/5ed2d072-485b-4a53-a0fa-a41412791397-image_three.png","https://flower.elevateegy.com/uploads/c0992ec6-d3c0-4a54-b7ec-4cf000138367-image_two.png"],"price":250,"priceAfterDiscount":150,"quantity":691,"category":"673c46fd1159920171827c85","occasion":"673b34c21159920171827ae0","createdAt":"2024-11-20T18:35:05.594Z","updatedAt":"2025-04-01T18:42:35.619Z","__v":0,"sold":309,"discount":50,"id":"673e2bd91159920171828139"},{"rateAvg":5,"rateCount":0,"_id":"6745096c90ab40a0685402fc","title":"Forever Pink | Baby Roses","slug":"forever-pink-or-baby-roses","description":"A gift of pink baby roses holds profound meaning. It symbolizes love, gratitude, and appreciation, making it a perfect choice for any occasion. The soft, feminine hue of pink baby roses embodies notions of nurturing and emotional love. They are also a gentle way to express sympathy or convey a message filled with kindness. These pink baby roses represent a significant gesture of love or a heartfelt wish for good luck and happiness. Embrace the power of pink roses to convey your emotions and leave a lasting impression.","imgCover":"https://flower.elevateegy.com/uploads/336d4a68-109d-4f29-a35c-d5ca2215b4ff-cover_image.png","images":["https://flower.elevateegy.com/uploads/ef146ee3-ac7c-4bbd-a2f7-9ddae14d0656-image_four.png","https://flower.elevateegy.com/uploads/6e1fa180-7b99-4dd5-95f0-032715a0f04e-image_one.png","https://flower.elevateegy.com/uploads/3594e620-5411-4c6f-bf4f-188e312ee391-image_three.png","https://flower.elevateegy.com/uploads/8cfb2f72-c8e8-47f6-bf10-70f43b3e0fed-image_two.png"],"price":2049,"priceAfterDiscount":1899,"quantity":4959,"category":"673c46fd1159920171827c85","occasion":"673b34c21159920171827ae0","createdAt":"2024-11-25T23:34:04.896Z","updatedAt":"2025-03-15T01:40:37.151Z","__v":0,"discount":50,"sold":41,"id":"6745096c90ab40a0685402fc"},{"rateAvg":5,"rateCount":0,"_id":"67450f1c90ab40a068540338","title":"Cheerful White Gerbera Bouquet","slug":"cheerful-white-gerbera-bouquet","description":"Brighten someone’s day with a beautiful bouquet of White Gerbera Flowers, known for their cheerful and uplifting charm. Gerberas are a popular choice for gifts and decorations, celebrated for their bold, radiant blooms. The pure white color adds a touch of elegance, symbolizing purity, innocence, and happiness—perfect for expressing heartfelt emotions. This bouquet brings joy and warmth wherever it’s placed. Show someone how much they mean to you—buy now to gift this thoughtful and meaningful gesture of happiness and","imgCover":"https://flower.elevateegy.com/uploads/4102cb21-bf4b-45e1-bb5a-1cb4b55755cb-cover_image.png","images":["https://flower.elevateegy.com/uploads/67829fd4-bc43-4e89-be87-136c3e422749-image_four.png","https://flower.elevateegy.com/uploads/01baf509-775a-446f-a8fb-b917294b3ec0-image_one.png","https://flower.elevateegy.com/uploads/e41f1df8-5431-4da7-8fd7-9ea91e08f56c-image_three.png","https://flower.elevateegy.com/uploads/f44b9294-aefd-4f56-a025-71335effc639-image_two.png"],"price":749,"priceAfterDiscount":499,"quantity":4957,"category":"673c46fd1159920171827c85","occasion":"673b34c21159920171827ae0","createdAt":"2024-11-25T23:58:20.088Z","updatedAt":"2025-03-15T02:05:03.890Z","__v":0,"discount":50,"sold":43,"id":"67450f1c90ab40a068540338"}]

class ProductsResponseEntity {
  ProductsResponseEntity({
      this.message, 
      this.metadata, 
      this.products,});

  String? message;
  Metadata? metadata;
  List<Products>? products;

}

class Products extends Equatable{
  const Products({
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.imgCover, 
      this.images, 
      this.price, 
      this.priceAfterDiscount, 
      this.quantity, 
      this.category, 
      this.occasion, 

      this.v,
      this.discount, 
      this.sold, 
      this.rateAvg, 
      this.rateCount, 
      });


  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final num? price;
  final num? priceAfterDiscount;
  final num? quantity;
  final String? category;
  final String? occasion;
  final num? v;
  final num? discount;
  final num? sold;
  final num? rateAvg;
  final num? rateCount;

  @override
  List<Object?> get props => [
    id,
    title,
    slug,
  ];
}

class Metadata {
  Metadata({
      this.currentPage, 
      this.totalPages, 
      this.limit, 
      this.totalItems,});

  num? currentPage;
  num? totalPages;
  num? limit;
  num? totalItems;
}
