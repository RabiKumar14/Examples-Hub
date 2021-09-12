import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models.dart';

// ignore: use_key_in_widget_constructors
class PaymentHistoryPage extends StatefulWidget {
  @override
  _PaymentHistoryPageState createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  List<User> users = [];
  List<String> dates = ['24th June 2019', '29th June 2019', '2nd July 2019'];

  String selectedMonth = 'June 2019';

  // Integrate your API SERVICE here
  // You only need to define where are your data come from
  // and ready.
  _getUsers() async {
    var temp = await ApiService.getUsers(nrUsers: 5);
    setState(() {
      users = temp;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Payment History',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: LayoutBuilder(
              builder: (_, constraints) => Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            items: <String>[
                              'January 2019',
                              'February 2019',
                              'March 2019',
                              'April 2019',
                              'May 2019',
                              'June 2019',
                              'July 2019',
                              'August 2019',
                              'September 2019',
                              'Octomber 2019',
                              'November 2019',
                              'December 2019'
                            ].map((val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Container(
                                    color: Colors.white,
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(val))),
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                selectedMonth = val.toString();
                              });
                            },
                            value: selectedMonth,
                            isExpanded: true,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            elevation: 0,
                          ),
                        ),
                      ),
                      Flexible(
                        child: ListView(children: [
                          ...dates
                              .map((date) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(date,
                                            style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Center(
                                        // ignore: prefer_is_empty
                                        child: users.length == 0
                                            ? const CupertinoActivityIndicator()
                                            : Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0,
                                                        vertical: 8.0),
                                                color: Colors.white,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: users
                                                      .map((user) => Column(
                                                            children: <Widget>[
                                                              Row(
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            16.0),
                                                                    child:
                                                                        CircleAvatar(
                                                                      maxRadius:
                                                                          24,
                                                                      backgroundImage: NetworkImage(user
                                                                          .picture!
                                                                          .thumbnail!),
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 16.0),
                                                                        child: Text(
                                                                            user.name!.first! +
                                                                                ' ' +
                                                                                user.name!.last!,
                                                                            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            top:
                                                                                8.0,
                                                                            bottom:
                                                                                16.0),
                                                                        child:
                                                                            Text(
                                                                          user.phone!,
                                                                        ),
                                                                      ),
                                                                      const Text(
                                                                        'Request',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                10.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  const Spacer(),
                                                                  Column(
                                                                    children: <
                                                                        Widget>[
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: const <
                                                                            Widget>[
                                                                          Text(
                                                                            '\$ ',
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                                                                          ),
                                                                          Text(
                                                                            '90.00',
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const Padding(
                                                                        padding:
                                                                            EdgeInsets.symmetric(vertical: 8.0),
                                                                        child: Text(
                                                                            '2:00 am',
                                                                            style:
                                                                                TextStyle(fontSize: 12, color: Colors.grey)),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            64.0),
                                                                child:
                                                                    Divider(),
                                                              )
                                                            ],
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                      ),
                                    ],
                                  ))
                              .toList(),
                        ]),
                      ),
                    ],
                  )),
        ));
  }
}