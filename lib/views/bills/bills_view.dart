import 'package:flutter/material.dart';
import 'package:web_drawer/model/finance.dart';
import 'package:web_drawer/services/data.dart';
import 'package:web_drawer/widget/charts/pie_chart.dart';

class BillsView extends StatefulWidget {
  @override
  _BillsViewState createState() => _BillsViewState();
}

class _BillsViewState extends State<BillsView>
  with SingleTickerProviderStateMixin {
  final List<BillData> items = DummyDataService.getBillDataList();

  @override
  Widget build(BuildContext context) {
    double dueTotal = sumBillDataPrimaryAmount(items);
    return FinancialEntityView(
        heroLabel: 'Due',
        heroAmount: dueTotal,
        segments: buildSegmentsFromBillItems(items),
    wholeAmount: dueTotal,
    financialEntityCards: buildBillDataListViews(items),
    );
  }
}
