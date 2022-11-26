import 'package:apitest/services/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DataProvider dataProvider;

  @override
  void initState() {
    dataProvider = Provider.of(context, listen: false);
    dataProvider.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dataProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: dataProvider.dataList.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.orange,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child:
              ListTile(
                leading: CircleAvatar(
                  child: Image.network(
                      dataProvider.dataList[index]["image"].toString()),
                ),
                title: Text(dataProvider.dataList[index]["category"].toString()),
                trailing: Text(dataProvider.dataList[index]["id"].toString()),
              )


            );
          }),
    );
  }
}
