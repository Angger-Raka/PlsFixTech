import 'package:flutter/cupertino.dart';

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Product 1",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
                "adalah layanan yang menyediakan jasa, produk, dan informasi yang berkaitan dengan kebutuhan anda. Kami menyediakan jasa yang berkualitas dan terpercaya."),
          ),
          const Text("Silahkan diisi untuk memesan jasa kami"),
        ],
      ),
    );
  }
}
