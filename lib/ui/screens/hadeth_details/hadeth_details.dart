import 'package:flutter/material.dart';
import 'package:islami_c11_mon/model/hadeth.dart';
import 'package:islami_c11_mon/ui/utils/app_style.dart';
import 'package:islami_c11_mon/ui/widgets/app_scaffold.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "hadeth_details";

  HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return AppScaffold(
        appBarTitle: hadeth.title, body: buildHadethContent(hadeth.content));
  }

  Widget buildHadethContent(String content) => Center(
        child: Container(
            height: MediaQuery.of(context).size.height * .8,
            width: MediaQuery.of(context).size.width * .8,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: SingleChildScrollView(
              child: Text(
                content,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: AppStyle.titlesTextStyle.copyWith(fontSize: 16),
              ),
            )),
      );
}
