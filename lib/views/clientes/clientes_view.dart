import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ClientesView extends StatefulWidget {
  final String title;
  ClientesView(this.title);

  @override
  _ClientesViewState createState() => _ClientesViewState();
}

class _ClientesViewState extends State<ClientesView> {
   final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidate: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FormBuilderTextField(
            attribute: "nome",
            decoration: InputDecoration(labelText: "Nome: "),
            validators: [
              FormBuilderValidators.required(),
            ],
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: MaterialButton(
            elevation: 4.0,
            onPressed: () {
              if (_formKey.currentState.saveAndValidate()) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
                print(_formKey.currentState.value);
              }
            },
            child: Text("Submit"),
          ),)
        ],
      ),

      //color: Colors.green,
      //child: Text("Clientes", style: TextStyle(fontSize: 18, color: Colors.white),),
    );
  }
}
