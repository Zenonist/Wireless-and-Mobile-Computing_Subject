class Product {
   final String image; 
   final String title;
   final String specification;
   final int price; 
   
   Product(this.image, this.title, this.specification, this.price); 
   factory Product.fromMap(Map<String, dynamic> json) { 
      return Product( 
         json['image'], 
         json['title'], 
         json['specification'], 
         json['price'], 
      );
   }
}