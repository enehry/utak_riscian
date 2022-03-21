import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utak_riscian/providers/game_screen_provider.dart';

class InputNameScreen extends StatefulWidget {
  const InputNameScreen({Key? key}) : super(key: key);

  @override
  State<InputNameScreen> createState() => _InputNameScreenState();
}

class _InputNameScreenState extends State<InputNameScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Before playing the game, please enter your name',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 20.0,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: _nameController,
                  textAlign: TextAlign.center,
                  autofocus: true,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 20.0,
                      ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    labelText: 'Name',
                    labelStyle: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 20.0,
                        ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  child: Text(
                    'Next',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 20.0,
                        ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context
                          .read<GameScreenProvider>()
                          .setName(_nameController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
