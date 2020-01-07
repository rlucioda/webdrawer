import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:web_drawer/views/accounts/accounts.dart';
import 'package:web_drawer/views/bills/bills_view.dart';
import 'package:web_drawer/views/budgets/budgets.dart';
import 'package:web_drawer/views/overview/overview_view.dart';
import 'package:web_drawer/views/settings/settings_view.dart';

const int tabCount = 5;

class HomeContentMobile extends StatefulWidget {
  const HomeContentMobile({Key key}) : super(key: key);
  @override
  _HomeContentMobileState createState() => _HomeContentMobileState();
}

class _HomeContentMobileState extends State<HomeContentMobile>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  _HomeContentMobileState() {
    _tabController = TabController(length: tabCount, vsync: this);
  }

  @override
  void initState() {
    super.initState();
    print('_HomeContentMobileState initState');

    _tabController.addListener(() {
      if (_tabController.indexIsChanging &&
          _tabController.previousIndex != _tabController.index) {
        setState(() {});
      }
    });
  }

  @override
  dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Theme(
                data: theme.copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: TabBar(
                  tabs: _buildTabs(theme),
                  isScrollable: true,
                  labelPadding: EdgeInsets.zero,
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                ),
              ),
              Expanded(
                  child: TabBarView(
                controller: _tabController,
                children: _buildTabViews(),
              )),
            ]),
      ),
    );
  }

  List<Widget> _buildTabs(ThemeData theme) {
    return <Widget>[
      _buildTab(theme, Icons.pie_chart, 'RESUMO', 0),
      _buildTab(theme, Icons.attach_money, 'EVENTOS', 1),
      _buildTab(theme, Icons.money_off, 'DESPESAS', 2),
      _buildTab(theme, Icons.table_chart, 'AGENDA', 3),
      _buildTab(theme, Icons.settings, 'CONFIGURAÇÂO', 4),
    ];
  }

  List<Widget> _buildTabViews() {
    return [
      OverviewView(), /** ?  Resumo */
      AccountsView(), // Eventos
      BillsView(), /* Despesas */
      BudgetsView(), /** Agenda*/
      SettingsView(), // Opções
    ];
  }

  Widget _buildTab(
    ThemeData theme,
    IconData iconData,
    String title,
    int index,
  ) {
    return _RallyTab(
      theme.textTheme.button,
      Icon(iconData),
      title,
      _tabController.index == index,
    );
  }
}

class _RallyTab extends StatefulWidget {
  final TextStyle style;
  final Text titleText;
  final Icon icon;
  final bool isExpanded;

  _RallyTab(TextStyle style, Icon icon, String title, bool isExpanded)
      : this.style = style,
        this.titleText = Text(title, style: style),
        this.icon = icon,
        this.isExpanded = isExpanded;

  _RallyTabState createState() => _RallyTabState();
}

class _RallyTabState extends State<_RallyTab>
    with SingleTickerProviderStateMixin {
  Animation<double> _titleSizeAnimation;
  Animation<double> _titleFadeAnimation;
  Animation<double> _iconFadeAnimation;
  AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _titleSizeAnimation = _controller.view;
    _titleFadeAnimation = _controller.drive(CurveTween(curve: Curves.easeOut));
    _iconFadeAnimation = _controller.drive(Tween(begin: 0.6, end: 1));
    if (widget.isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(_RallyTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  Widget build(BuildContext context) {
    // Calculate the width of each unexpanded tab by counting the number of
    // units and dividing it into the screen width. Each unexpanded tab is 1
    // unit, and there is always 1 expanded tab which is 1 unit + any extra
    // space determined by the multiplier.
    final double width = MediaQuery.of(context).size.width;
    final double expandedTitleWidthMultiplier = 2;
    final double unitWidth = width / (tabCount + expandedTitleWidthMultiplier);

    return SizedBox(
      height: 56,
      child: Row(
        children: <Widget>[
          FadeTransition(
            child: SizedBox(
              width: unitWidth,
              child: widget.icon,
            ),
            opacity: _iconFadeAnimation,
          ),
          FadeTransition(
            child: SizeTransition(
              child: SizedBox(
                width: unitWidth * expandedTitleWidthMultiplier,
                child: Center(child: widget.titleText),
              ),
              axis: Axis.horizontal,
              axisAlignment: -1,
              sizeFactor: _titleSizeAnimation,
            ),
            opacity: _titleFadeAnimation,
          ),
        ],
      ),
    );
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

}
