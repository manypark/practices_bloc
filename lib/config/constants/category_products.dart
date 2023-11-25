import 'package:practices/features/products/domain/domain.dart';

class CategoriesProducts {

  static List<String> categories = [
      "smartphones",
      "laptops",
      "fragrances",
      "skincare",
      "groceries",
      "home-decoration",
      "furniture",
      "tops",
      "womens-dresses",
      "womens-shoes",
      "mens-shirts",
      "mens-shoes",
      "mens-watches",
      "womens-watches",
      "womens-bags",
      "womens-jewellery",
      "sunglasses",
      "automotive",
      "motorcycle",
      "lighting"
    ];
  
  static List<Map<String, dynamic>> mockListProducts = [

    {
        "id": 11,
        "title": "perfume Oil",
        "description": "Mega Discount, Impression of Acqua Di Gio by GiorgioArmani concentrated attar perfume Oil",
        "price": 13,
        "discountPercentage": 8.4,
        "rating": 4.26,
        "stock": 65,
        "brand": "Impression of Acqua Di Gio",
        "category": "fragrances",
        "thumbnail": "https://i.dummyjson.com/data/products/11/thumbnail.jpg",
        "images": [
            "https://i.dummyjson.com/data/products/11/1.jpg",
            "https://i.dummyjson.com/data/products/11/2.jpg",
            "https://i.dummyjson.com/data/products/11/3.jpg",
            "https://i.dummyjson.com/data/products/11/thumbnail.jpg"
        ]
    },
    {
        "id": 12,
        "title": "Brown Perfume",
        "description": "Royal_Mirage Sport Brown Perfume for Men & Women - 120ml",
        "price": 40,
        "discountPercentage": 15.66,
        "rating": 4,
        "stock": 52,
        "brand": "Royal_Mirage",
        "category": "fragrances",
        "thumbnail": "https://i.dummyjson.com/data/products/12/thumbnail.jpg",
        "images": [
            "https://i.dummyjson.com/data/products/12/1.jpg",
            "https://i.dummyjson.com/data/products/12/2.jpg",
            "https://i.dummyjson.com/data/products/12/3.png",
            "https://i.dummyjson.com/data/products/12/4.jpg",
            "https://i.dummyjson.com/data/products/12/thumbnail.jpg"
        ]
    }
  ];

  static List<Product> mockProductJsonToEntity = [
    
    const Product(
      id: 11,
      title: "perfume Oil",
      description: "Mega Discount, Impression of Acqua Di Gio by GiorgioArmani concentrated attar perfume Oil",
      price: 13,
      discountPercentage: 8.4,
      rating: 4.26,
      stock: 65,
      brand: "Impression of Acqua Di Gio",
      category: "fragrances",
      thumbnail: "https://i.dummyjson.com/data/products/11/thumbnail.jpg",
      images: [
          "https://i.dummyjson.com/data/products/11/1.jpg",
          "https://i.dummyjson.com/data/products/11/2.jpg",
          "https://i.dummyjson.com/data/products/11/3.jpg",
          "https://i.dummyjson.com/data/products/11/thumbnail.jpg"
      ]
    ),

    const Product(
      id: 12,
      title: "Brown Perfume",
      description: "Royal_Mirage Sport Brown Perfume for Men & Women - 120ml",
      price: 40,
      discountPercentage: 15.66,
      rating: 4,
      stock: 52,
      brand: "Royal_Mirage",
      category: "fragrances",
      thumbnail: "https://i.dummyjson.com/data/products/12/thumbnail.jpg",
      images: [
          "https://i.dummyjson.com/data/products/12/1.jpg",
          "https://i.dummyjson.com/data/products/12/2.jpg",
          "https://i.dummyjson.com/data/products/12/3.png",
          "https://i.dummyjson.com/data/products/12/4.jpg",
          "https://i.dummyjson.com/data/products/12/thumbnail.jpg"
      ]
    ),
  ];
  
  static List<Map<String, dynamic>> mockListProductsByCategory = [
        {
            "id": 1,
            "title": "iPhone 9",
            "description": "An apple mobile which is nothing like apple",
            "price": 549,
            "discountPercentage": 12.96,
            "rating": 4.69,
            "stock": 94,
            "brand": "Apple",
            "category": "smartphones",
            "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
            "images": [
                "https://i.dummyjson.com/data/products/1/1.jpg",
                "https://i.dummyjson.com/data/products/1/2.jpg",
                "https://i.dummyjson.com/data/products/1/3.jpg",
                "https://i.dummyjson.com/data/products/1/4.jpg",
                "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
            ]
        },
        {
            "id": 2,
            "title": "iPhone X",
            "description": "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
            "price": 899,
            "discountPercentage": 17.94,
            "rating": 4.44,
            "stock": 34,
            "brand": "Apple",
            "category": "smartphones",
            "thumbnail": "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
            "images": [
                "https://i.dummyjson.com/data/products/2/1.jpg",
                "https://i.dummyjson.com/data/products/2/2.jpg",
                "https://i.dummyjson.com/data/products/2/3.jpg",
                "https://i.dummyjson.com/data/products/2/thumbnail.jpg"
            ]
        },
        {
            "id": 3,
            "title": "Samsung Universe 9",
            "description": "Samsung's new variant which goes beyond Galaxy to the Universe",
            "price": 1249,
            "discountPercentage": 15.46,
            "rating": 4.09,
            "stock": 36,
            "brand": "Samsung",
            "category": "smartphones",
            "thumbnail": "https://i.dummyjson.com/data/products/3/thumbnail.jpg",
            "images": [
                "https://i.dummyjson.com/data/products/3/1.jpg"
            ]
        },
        {
            "id": 4,
            "title": "OPPOF19",
            "description": "OPPO F19 is officially announced on April 2021.",
            "price": 280,
            "discountPercentage": 17.91,
            "rating": 4.3,
            "stock": 123,
            "brand": "OPPO",
            "category": "smartphones",
            "thumbnail": "https://i.dummyjson.com/data/products/4/thumbnail.jpg",
            "images": [
                "https://i.dummyjson.com/data/products/4/1.jpg",
                "https://i.dummyjson.com/data/products/4/2.jpg",
                "https://i.dummyjson.com/data/products/4/3.jpg",
                "https://i.dummyjson.com/data/products/4/4.jpg",
                "https://i.dummyjson.com/data/products/4/thumbnail.jpg"
            ]
        },
        {
            "id": 5,
            "title": "Huawei P30",
            "description": "Huawei’s re-badged P30 Pro New Edition was officially unveiled yesterday in Germany and now the device has made its way to the UK.",
            "price": 499,
            "discountPercentage": 10.58,
            "rating": 4.09,
            "stock": 32,
            "brand": "Huawei",
            "category": "smartphones",
            "thumbnail": "https://i.dummyjson.com/data/products/5/thumbnail.jpg",
            "images": [
                "https://i.dummyjson.com/data/products/5/1.jpg",
                "https://i.dummyjson.com/data/products/5/2.jpg",
                "https://i.dummyjson.com/data/products/5/3.jpg"
            ]
        }
  ];

  static List<Product> mockProductJsonToEntityByCategory = [

    const Product(
      id: 1,
      title: "iPhone 9",
      description: "An apple mobile which is nothing like apple",
      price: 549,
      discountPercentage: 12.96,
      rating: 4.69,
      stock: 94,
      brand: "Apple",
      category: "smartphones",
      thumbnail: "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
      images: [
          "https://i.dummyjson.com/data/products/1/1.jpg",
          "https://i.dummyjson.com/data/products/1/2.jpg",
          "https://i.dummyjson.com/data/products/1/3.jpg",
          "https://i.dummyjson.com/data/products/1/4.jpg",
          "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
      ]
    ),
    const Product(
      id: 2,
      title: "iPhone X",
      description: "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
      price: 899,
      discountPercentage: 17.94,
      rating: 4.44,
      stock: 34,
      brand: "Apple",
      category: "smartphones",
      thumbnail: "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
      images: [
          "https://i.dummyjson.com/data/products/2/1.jpg",
          "https://i.dummyjson.com/data/products/2/2.jpg",
          "https://i.dummyjson.com/data/products/2/3.jpg",
          "https://i.dummyjson.com/data/products/2/thumbnail.jpg"
      ]
    ),
    const Product(
      id: 3,
      title: "Samsung Universe 9",
      description: "Samsung's new variant which goes beyond Galaxy to the Universe",
      price: 1249,
      discountPercentage: 15.46,
      rating: 4.09,
      stock: 36,
      brand: "Samsung",
      category: "smartphones",
      thumbnail: "https://i.dummyjson.com/data/products/3/thumbnail.jpg",
      images: [
          "https://i.dummyjson.com/data/products/3/1.jpg"
      ]
    ),
    const Product(
      id: 4,
      title: "OPPOF19",
      description: "OPPO F19 is officially announced on April 2021.",
      price: 280,
      discountPercentage: 17.91,
      rating: 4.3,
      stock: 123,
      brand: "OPPO",
      category: "smartphones",
      thumbnail: "https://i.dummyjson.com/data/products/4/thumbnail.jpg",
      images: [
          "https://i.dummyjson.com/data/products/4/1.jpg",
          "https://i.dummyjson.com/data/products/4/2.jpg",
          "https://i.dummyjson.com/data/products/4/3.jpg",
          "https://i.dummyjson.com/data/products/4/4.jpg",
          "https://i.dummyjson.com/data/products/4/thumbnail.jpg"
      ]
    ),
    const Product(
      id: 5,
      title: "Huawei P30",
      description: "Huawei’s re-badged P30 Pro New Edition was officially unveiled yesterday in Germany and now the device has made its way to the UK.",
      price: 499,
      discountPercentage: 10.58,
      rating: 4.09,
      stock: 32,
      brand: "Huawei",
      category: "smartphones",
      thumbnail: "https://i.dummyjson.com/data/products/5/thumbnail.jpg",
      images: [
        "https://i.dummyjson.com/data/products/5/1.jpg",
        "https://i.dummyjson.com/data/products/5/2.jpg",
        "https://i.dummyjson.com/data/products/5/3.jpg"
      ]
    ),

  ];

  static List<Map<String, dynamic>> mockListProductsSearch = [
    {
        "id": 68,
        "title": "Stylish Luxury Digital Watch",
        "description": "Stylish Luxury Digital Watch For Girls / Women - Led Smart Ladies Watches For Girls",
        "price": 57,
        "discountPercentage": 9.03,
        "rating": 4.55,
        "stock": 77,
        "brand": "Luxury Digital",
        "category": "womens-watches",
        "thumbnail": "https://i.dummyjson.com/data/products/68/thumbnail.webp",
        "images": [
          "https://i.dummyjson.com/data/products/68/1.jpg",
          "https://i.dummyjson.com/data/products/68/2.jpg"
        ]
    }
  ];

  static List<Product> mockProductJsonToEntitySearch = [

    const Product(
      id: 68,
      title: "Stylish Luxury Digital Watch",
      description: "Stylish Luxury Digital Watch For Girls / Women - Led Smart Ladies Watches For Girls",
      price: 57,
      discountPercentage: 9.03,
      rating: 4.55,
      stock: 77,
      brand: "Luxury Digital",
      category: "womens-watches",
      thumbnail: "https://i.dummyjson.com/data/products/68/thumbnail.webp",
      images: [
        "https://i.dummyjson.com/data/products/68/1.jpg",
        "https://i.dummyjson.com/data/products/68/2.jpg"
      ]
    ),
  ];

}