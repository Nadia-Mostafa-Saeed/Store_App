import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/product_model.dart';
import 'package:store/pages/update_product_page.dart';

class CustomCard extends StatefulWidget {
  CustomCard({
    super.key,
    required this.product,
  });
  ProductModel product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  Color color = Colors.black;
  void toggleColor() {
    color = color == Colors.black ? Colors.pink : Colors.black;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id,
            arguments: widget.product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            child: Card(
              color: const Color(0xffFFFFFF),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title.substring(0, 6),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${widget.product.price.toString()}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: toggleColor,
                          child: Icon(
                            FontAwesomeIcons.solidHeart,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: -60,
            child: Image.network(
              widget.product.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
