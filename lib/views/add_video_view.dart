import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/colors.dart';
import '../widgets/input_decoration.dart';

class AddVideoPage extends StatefulWidget {
  const AddVideoPage({Key? key}) : super(key: key);

  @override
  State<AddVideoPage> createState() => _AddVideoPageState();
}

class _AddVideoPageState extends State<AddVideoPage> {
  final GlobalKey<FormState> _nameKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _linkKey = GlobalKey();
  final TextEditingController _linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).hintColor,
        title: Text("Add New Video", style: TextStyle(color: Theme.of(context).primaryColor),),
        leading: BackButton(color: Theme.of(context).primaryColor,),
        actions: [
          TextButton(
            onPressed: () {
              if (_nameKey.currentState!.validate() && _linkKey.currentState!.validate()) {
                addVideo(_nameController.text, _linkController.text);
                Navigator.pop(context);
              }
            },
            child: Text("Save", style: TextStyle(color: Theme.of(context).primaryColor),),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Form(
                key: _nameKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  cursorColor: Theme.of(context).disabledColor,
                  controller: _nameController,
                  validator: (value) {
                    String? output = value?.replaceAll(' ', '');
                    if(output == '') {
                      return 'Invalid name';
                    }
                    return null;
                  },
                  style: TextStyle(color: greenColor),
                  decoration: buildInputDecoration(context, "Name"),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _linkKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  cursorColor: Theme.of(context).disabledColor,
                  controller: _linkController,
                  validator: (value) {
                    String? output = value?.replaceAll(' ', '');
                    if(output == '') {
                      return 'Invalid URL';
                    }
                    return null;
                  },
                  style: TextStyle(color: greenColor),
                  decoration: buildInputDecoration(context, "URL"),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
