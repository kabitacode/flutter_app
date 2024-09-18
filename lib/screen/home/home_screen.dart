import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth_provider.dart';
import 'package:flutter_app/providers/home_provider.dart';
import 'package:flutter_app/services/home_Services.dart';
import 'package:flutter_app/utils/theme.dart';
import 'package:flutter_app/widgets/custom_button_icon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  void initState() {
    super.initState();
    getProduct();
  }

  void getProduct() async {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<AuthProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    CustomButtonIcon(
                        icon: Icons.discount,
                        colorButton: AppColors.orange,
                        onTap: () {},
                        label: "Discount"),
                    CustomButtonIcon(
                        icon: Icons.broadcast_on_personal_outlined,
                        colorButton: AppColors.primary,
                        onTap: () {},
                        label: "Credit"),
                    CustomButtonIcon(
                        icon: Icons.payment,
                        colorButton: AppColors.secondary,
                        onTap: () {},
                        label: "Payment"),
                    CustomButtonIcon(
                        icon: Icons.phone_android_sharp,
                        colorButton: AppColors.other,
                        onTap: () {},
                        label: "TopUp"),
                    CustomButtonIcon(
                        icon: Icons.payments_rounded,
                        colorButton: AppColors.other1,
                        onTap: () {},
                        label: "Voucher"),
                    CustomButtonIcon(
                        icon: Icons.paypal_outlined,
                        colorButton: AppColors.other2,
                        onTap: () {},
                        label: "Bill"),
                    CustomButtonIcon(
                        icon: Icons.monetization_on_outlined,
                        colorButton: AppColors.other3,
                        onTap: () {},
                        label: "Claim"),
                    CustomButtonIcon(
                        icon: Icons.games,
                        colorButton: AppColors.purple,
                        onTap: () {},
                        label: "Games"),
                  ],
                ),
                Consumer<HomeProvider>(builder: (context, value, child) {
                  if (homeProvider.products.isEmpty) {
                    return Center(
                      child: Text(
                        "Data is Empty",
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: AppColors.typography),
                      ),
                    );
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: homeProvider.products.length,
                        itemBuilder: (context, index) {
                          final item = homeProvider.products[index];
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(12),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade200,
                                        spreadRadius: 1,
                                        blurRadius: 5)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    item.category.image,
                                    height: 100,
                                    width: 100,
                                    errorBuilder: (context, error, stactTrace) {
                                      return Icon(Icons.image, size: 120);
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.title,
                                          style: GoogleFonts.lato(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.typography),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          item.description.length > 20
                                              ? item.description
                                                      .substring(0, 80) +
                                                  '...'
                                              : item.description,
                                          style: GoogleFonts.lato(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300,
                                              color: AppColors.typography),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }
                })
              ],
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Icon(Icons.camera_alt_outlined),
                    ),
                    Expanded(
                        child: Container(
                      height: 45,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          labelText: "Search..",
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primary, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: TextStyle(
                            fontSize: 15, color: AppColors.typography),
                      ),
                    )),
                  ],
                ),
              ))
        ],
      )),
    );
  }
}

class UncontainedLayoutCard extends StatelessWidget {
  const UncontainedLayoutCard({
    super.key,
    required this.index,
    required this.label,
  });

  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.5),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          overflow: TextOverflow.clip,
          softWrap: false,
        ),
      ),
    );
  }
}
