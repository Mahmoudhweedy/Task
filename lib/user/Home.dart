import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task/General/Constants/DefaultAppBar.dart';
import 'package:task/General/Constants/MyColors.dart';
import 'package:task/General/Constants/MyDialog.dart';
import 'package:task/General/Constants/MyText.dart';
import 'package:task/General/Constants/constants.dart';
import 'package:task/General/Providers/PaymentProvider.dart';
import 'package:task/General/Resources/GetPayments.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void didChangeDependencies() {
    context.read<PaymentProvider>().getPayment();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'مدفوعات هلا', leading: SizedBox()),
      body: Consumer<PaymentProvider>(
          builder: (_, payment, child) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 6,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: MyColors.yellow,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText(
                                    title: 'اجمالي المدفوعات',
                                    size: 12,
                                  ),
                                  MyText(
                                    title:
                                        '${payment.totalPayments} ريال سعودي',
                                    size: 12,
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () =>
                                MyDialog(context).showAddItemsDialouge(),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: kBoxShadow2,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                FontAwesomeIcons.filter,
                                size: 18,
                                color: MyColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: payment.payment.isEmpty
                        ? Center(
                            child: MyText(
                              title: 'لا يوجد مدفوعات !',
                              size: 20,
                            ),
                          )
                        : AnimationLimiter(
                            child: ListView.builder(
                              itemCount: payment.payment.length,
                              itemBuilder: (BuildContext context, int index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 700),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: Container(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 15),
                                        decoration: BoxDecoration(
                                            boxShadow: kBoxShadow2,
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: ExpansionPanelList(
                                          children: [
                                            ExpansionPanel(
                                                isExpanded: payment
                                                    .payment[index].isOpened,
                                                canTapOnHeader: true,
                                                headerBuilder: (context,
                                                        isExpanded) =>
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 15),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              MyText(
                                                                title: payment
                                                                    .payment[
                                                                        index]
                                                                    .fullNameAR,
                                                                color: MyColors
                                                                    .primary,
                                                              ),
                                                              MyText(
                                                                title: payment
                                                                    .payment[
                                                                        index]
                                                                    .mobileNumber,
                                                              )
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              MyText(
                                                                title:
                                                                    '${payment.payment[index].amount}',
                                                                color: MyColors
                                                                    .red,
                                                              ),
                                                              MyText(
                                                                title:
                                                                    'ريال سعودي',
                                                                color: MyColors
                                                                    .grey,
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                body: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15),
                                                  color: MyColors.bg,
                                                  child: Column(
                                                    children: [
                                                      BodyRow(
                                                        title: 'رقم التحويل : ',
                                                        value: payment
                                                            .payment[index]
                                                            .trxRef!,
                                                      ),
                                                      BodyRow(
                                                        title:
                                                            'تاريخ التحويل : ',
                                                        value: payment
                                                            .payment[index]
                                                            .trxDate!,
                                                      ),
                                                      BodyRow(
                                                        title: 'اسم المنشأة : ',
                                                        value: payment
                                                            .payment[index]
                                                            .corporateFullNameAR!,
                                                      ),
                                                    ],
                                                  ),
                                                ))
                                          ],
                                          expansionCallback:
                                              (index, isExpanded) {
                                            payment.payment[index].isOpened =
                                                !payment
                                                    .payment[index].isOpened;
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                ],
              )),
    );
  }
}

class BodyRow extends StatelessWidget {
  const BodyRow({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyText(
          title: '$title',
          size: 12,
        ),
        MyText(
          title: '$value',
          color: title.contains('المنشأة') ? MyColors.primary : Colors.black,
        ),
      ],
    );
  }
}
