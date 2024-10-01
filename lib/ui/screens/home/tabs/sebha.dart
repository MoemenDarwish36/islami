import 'package:flutter/material.dart';

import '../../../utilise/app_assets.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  int index = 0;
  double turn = 0;

  List<String> azkhar = ["الله أكبر", "الحمد لله", "سبحان الله"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Stack(
            alignment: Alignment.topCenter,

            ///to edit by manual
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Image.asset(AppAssets.headOfSebha),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .04),
                child: AnimatedRotation(
                    duration: const Duration(microseconds: 500),
                    turns: turn,
                    child: Image.asset(AppAssets.bodyOfSebha)),
              )
            ],
          ),
        ),
        Expanded(
            flex: 3,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text("عدد التسبيحات",
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(.5),
                      borderRadius: BorderRadius.circular(24)),
                  child: Text(
                    count.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(.7)),
                    onPressed: () {
                      setState(() {
                        count++;
                        turn += .03;
                        if (count == 34) {
                          count = 0;
                          index++;
                          if (index == azkhar.length) {
                            index = 0;
                          }
                        }
                      });
                    },
                    child: Text(
                      azkhar[index],
                      style: Theme.of(context).textTheme.titleMedium,
                    ))
              ],
            ))
      ],
    );
  }
}
