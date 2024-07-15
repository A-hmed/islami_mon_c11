import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c11_mon/model/sura_details_args.dart';
import 'package:islami_c11_mon/ui/utils/app_colors.dart';
import 'package:islami_c11_mon/ui/utils/app_style.dart';
import 'package:islami_c11_mon/ui/widgets/app_scaffold.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura_details";

  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDetailsArgs args;

  String fileContent = "";

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (fileContent.isEmpty) {
      readFile();
    }
    return AppScaffold(
        appBarTitle: args.suraName,
        body: fileContent.isEmpty ? buildLoading() : buildSuraContent());
  }

  Center buildLoading() {
    return const Center(
        child: CircularProgressIndicator(
      color: AppColors.primaryColor,
    ));
  }

  Widget buildSuraContent() => Center(
        child: Container(
            height: MediaQuery.of(context).size.height * .8,
            width: MediaQuery.of(context).size.width * .8,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: SingleChildScrollView(
              child: Text(
                fileContent,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: AppStyle.titlesTextStyle.copyWith(fontSize: 16),
              ),
            )),
      );

  Future readFile() async {
    fileContent =
        await rootBundle.loadString("assets/files/quran/${args.fileName}");
    List<String> fileLines = fileContent.split("\n");
    fileLines = fileLines.where((line) => line.trim().isNotEmpty).toList();
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] += "(${i + 1})";
    }
    fileContent = fileLines.join();
    setState(() {});
  }
}
