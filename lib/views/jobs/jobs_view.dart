import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';

class JobsView extends StatefulWidget {
  final String title;

  const JobsView(this.title);

  @override
  _JobsViewState createState() => _JobsViewState();
}

class _JobsViewState extends State<JobsView> {
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
            decoration: InputDecoration(labelText: "Nome/descrição do job: "),
          ),
          FormBuilderTextField(
            attribute: "local",
            decoration: InputDecoration(labelText: "Local: "),
          ),
          FormBuilderTextField(
            attribute: "data",
            decoration: InputDecoration(labelText: "Data/Horário: "),
          ),
          FormBuilderTextField(
            attribute: "valor",
            decoration: InputDecoration(labelText: "Valor: "),
          ),
          FormBuilderTextField(
            attribute: "dataPagamento",
            decoration: InputDecoration(labelText: "Previsão de pagamento: "),
          ),
          FormBuilderTextField(
            attribute: "funcao",
            decoration: InputDecoration(labelText: "Função: "),
          ),
          FormBuilderTextField(
            attribute: "agencia",
            decoration: InputDecoration(labelText: "Agência: "),
          ),
          FormBuilderTextField(
            attribute: "observacao",
            decoration: InputDecoration(labelText: "Obs: "),
          ),
          FormBuilderTextField(
            attribute: "chegadaJob",
            decoration: InputDecoration(labelText: "Horário de chegada ao job: "),
          ),
          FormBuilderTextField(
            attribute: "comecoJob",
            decoration: InputDecoration(labelText: "Horário de começo do job: "),
          ),
          FormBuilderTextField(
            attribute: "terminoJob",
            decoration: InputDecoration(labelText: "Horário de término do job: "),
          ),
        ],
      ),
    );
  }
}
