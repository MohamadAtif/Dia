import 'package:diamart_commerce/features/orders/widgets/orders.dart';
import 'package:diamart_commerce/features/address/services/address_services.dart';

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../providers/user_provider.dart';

class AddressScreen extends StatefulWidget {
  final String totalAmount;
  const AddressScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();

  String addressToBeUsed = "";
  List<PaymentItem> paymentItems = [];
  final AddressServices addressServices = AddressServices();

  @override
  void initState() {
    super.initState();
    paymentItems.add(
      PaymentItem(
        amount: widget.totalAmount,
        label: 'Total Amount',
        status: PaymentItemStatus.final_price,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    phoneController.dispose();
    cityController.dispose();
  }

  // void onApplePayResult(res) {
  //   if (Provider.of<UserProvider>(context, listen: false)
  //       .user
  //       .address
  //       .isEmpty) {
  //     addressServices.saveUserAddress(
  //         context: context, address: addressToBeUsed);
  //   }
  //   addressServices.placeOrder(
  //     context: context,
  //     address: addressToBeUsed,
  //     totalSum: double.parse(widget.totalAmount),
  //   );
  // }

  // void onGooglePayResult(res) {
  //   if (Provider.of<UserProvider>(context, listen: false)
  //       .user
  //       .address
  //       .isEmpty) {
  //     addressServices.saveUserAddress(
  //         context: context, address: addressToBeUsed);
  //   }
  //   addressServices.placeOrder(
  //     context: context,
  //     address: addressToBeUsed,
  //     totalSum: double.parse(widget.totalAmount),
  //   );
  // }

  void payPressed(String addressFromProvider) async {
    addressToBeUsed = "";

    bool isForm = flatBuildingController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        phoneController.text.isNotEmpty ||
        cityController.text.isNotEmpty;
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveUserAddress(
          context: context, address: addressToBeUsed);
    }
    if (isForm) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            '${flatBuildingController.text}, ${areaController.text}, ${cityController.text}';
        if (Provider.of<UserProvider>(context, listen: false)
            .user
            .address
            .isEmpty) {
          addressServices.saveUserAddress(
              context: context, address: addressToBeUsed);
        }

        addressServices.placeOrder(
          context: context,
          address: addressToBeUsed,
          totalSum: double.parse(widget.totalAmount),
        );
      } else {
        showSnackBar(context, 'Please enter all the values!');
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;

      addressServices.placeOrder(
        context: context,
        address: addressToBeUsed,
        totalSum: double.parse(widget.totalAmount),
      );
    } else {
      showSnackBar(context, 'Check Fields!');
    }
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: GlobalVariables.backgroundColor,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '  $address',
                          style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Kanit',
                              color: Colors.teal),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'OR',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: flatBuildingController,
                      hintText: 'Flat, House no, Building',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: areaController,
                      hintText: 'Area, Street',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: cityController,
                      hintText: 'Town/City',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: phoneController,
                      hintText: 'Phone Number',
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              CustomButton(
                color: GlobalVariables.myTealColor,
                onTap: () {
                  payPressed(address);
                },
                text: 'Make Order',
              ),

              // ApplePayButton(
              //   width: double.infinity,
              //   style: ApplePayButtonStyle.whiteOutline,
              //   type: ApplePayButtonType.buy,
              //   paymentConfiguration:
              //       PaymentConfiguration.fromJsonString('applepay.json'),
              //   onPaymentResult: onApplePayResult,
              //   paymentItems: paymentItems,
              //   margin: const EdgeInsets.only(top: 15),
              //   height: 50,
              //   onPressed: () => payPressed(address),
              // ),
              // const SizedBox(height: 10),
              // CustomButton(
              //   color: Colors.yellow,
              //   onTap: () {
              //     showModalBottomSheet(
              //         context: context,
              //         builder: (context) {
              //           return const ShowPaymentBottomSheet();
              //         });
              //   },
              //   text: 'PAY',
              // ),
              // GooglePayButton(
              //   width: double.infinity,
              //   onPressed: () => payPressed(address),
              //   // paymentConfiguration:
              //   //     PaymentConfiguration.fromJsonString('gpay.json'),
              //   paymentConfigurationAsset: 'gpay.json',
              //   onPaymentResult: onGooglePayResult,
              //   paymentItems: paymentItems,
              //   height: 50,

              //   // style: GooglePayButtonStyle.black,
              //   type: GooglePayButtonType.buy,
              //   margin: const EdgeInsets.only(top: 15),
              //   loadingIndicator: const Center(
              //     child: CircularProgressIndicator(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// class ShowPaymentBottomSheet extends StatelessWidget {
//   const ShowPaymentBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         const SizedBox(
//           height: 10,
//         ),
//         const Row(
//           children: [
//             SizedBox(
//               width: 80,
//             ),
//             PaymentMethodItem(
//                 isActive: true, image: 'assets/images/SVGRepo_iconCarrier.png'),
//             SizedBox(
//               width: 30,
//             ),
//             PaymentMethodItem(
//                 isActive: false, image: 'assets/images/Group.png'),
//           ],
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         CustomButton(color: Colors.yellow, text: 'Continue', onTap: () {}),
//         const SizedBox(
//           height: 10,
//         ),
//       ],
//     );
//   }
// }
