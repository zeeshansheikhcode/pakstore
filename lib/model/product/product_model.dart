
class Product
{
   final int? initialprice;
   final int? price;
   final String? id;
   final String? name;
   final int? quantity;
   final String? imageUrl;
  

  Product( 
  {
    this.initialprice,
    this.price, 
    this.id,
    this.name,
    this.quantity,
    this.imageUrl 
   });

    Product copyWith({
    String? id,
    String? name,
    int? price,
    int? quantity,
    String? imageUrl,
    int? initialprice,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      initialprice : initialprice ?? this.initialprice,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
  
}