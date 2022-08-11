import 'package:cruzze_solutions/constants/color.dart';
import 'package:cruzze_solutions/constants/font.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.ticket}) : super(key: key);

  final ticket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: montserrat('Home', color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: ticket.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(
                                    Icons.airplane_ticket,
                                    size: 50,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    montserrat('${ticket[index].ticket}',
                                        size: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        montserrat(
                                            'Project : ${ticket[index].project}',
                                            size: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal),
                                        montserrat(
                                            'Title : ${ticket[index].title}',
                                            size: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal),
                                        montserrat(
                                            'Created By : ${ticket[index].createdBy}',
                                            size: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal),
                                        montserrat(
                                            'Created At : ${ticket[index].created}',
                                            size: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal),
                                        montserrat(
                                            'Priority : ${ticket[index].priority}',
                                            size: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        montserrat(
                                            '${ticket[index].status}',
                                            size: 16,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
