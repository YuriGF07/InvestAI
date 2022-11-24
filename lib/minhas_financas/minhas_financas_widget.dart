import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/cadastro_financa_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class MinhasFinancasWidget extends StatefulWidget {
  const MinhasFinancasWidget({Key? key}) : super(key: key);

  @override
  _MinhasFinancasWidgetState createState() => _MinhasFinancasWidgetState();
}

class _MinhasFinancasWidgetState extends State<MinhasFinancasWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pieChartColorsList = [Color(0xFF30CA30), Color(0xFFA8181A)];
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      drawer: Drawer(
        elevation: 16,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: AuthUserStreamWidget(
                      child: SelectionArea(
                          child: Text(
                        currentUserDisplayName,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                      )),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: SelectionArea(
                        child: Text(
                      currentUserEmail,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14,
                          ),
                    )),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('Perfil');
                    },
                    text: 'Perfil',
                    options: FFButtonOptions(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                      color: Color(0xFF2B23A2),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('PaginaInicial');
                  },
                  text: 'Inicial',
                  options: FFButtonOptions(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                    color: Color(0xFF2B23A2),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('MinhasFinancas');
                    },
                    text: 'Finanças',
                    options: FFButtonOptions(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                      color: Color(0xFF2B23A2),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await signOut();

                      context.goNamedAuth('Login', mounted);
                    },
                    text: 'Sair',
                    options: FFButtonOptions(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                      color: Color(0xFF6C6C6C),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF101213),
        automaticallyImplyLeading: false,
        actions: [],
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      scaffoldKey.currentState!.openDrawer();
                    },
                    text: '',
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                    ),
                    options: FFButtonOptions(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                      color: Colors.transparent,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
                      child: SelectionArea(
                          child: Text(
                        'Finanças',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        centerTitle: false,
        elevation: 4,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (valueOrDefault(currentUserDocument?.financa, 0) == 1)
                      AuthUserStreamWidget(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            StreamBuilder<List<FinancasRecord>>(
                              stream: queryFinancasRecord(
                                queryBuilder: (financasRecord) => financasRecord
                                    .where('uid',
                                        isEqualTo: currentUserUid != ''
                                            ? currentUserUid
                                            : null)
                                    .orderBy('data', descending: true),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<FinancasRecord>
                                    listViewFinancasRecordList = snapshot.data!;
                                // Return an empty Container when the document does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final listViewFinancasRecord =
                                    listViewFinancasRecordList.isNotEmpty
                                        ? listViewFinancasRecordList.first
                                        : null;
                                return ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 8, 10, 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SelectionArea(
                                                child: Text(
                                              'Saldo: R\$',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            )),
                                            SelectionArea(
                                                child: Text(
                                              valueOrDefault<String>(
                                                formatNumber(
                                                  listViewFinancasRecord!.total,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.commaDecimal,
                                                ),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: () {
                                                          if (listViewFinancasRecord!
                                                                  .total! <
                                                              0) {
                                                            return Color(
                                                                0xFFB70404);
                                                          } else if (listViewFinancasRecord!
                                                                  .total ==
                                                              0) {
                                                            return Color(
                                                                0xFFD5C61B);
                                                          } else {
                                                            return Color(
                                                                0xFF28C208);
                                                          }
                                                        }(),
                                                      ),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 5, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.black,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: double.infinity,
                                                child: CadastroFinancaWidget(
                                                  inserir: 'ganho',
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      text: 'Ganho',
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 10, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.black,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: double.infinity,
                                                child: CadastroFinancaWidget(
                                                  inserir: 'gasto',
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      text: 'Gasto',
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Grafico Finança por mês',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 10, 10),
                                      child:
                                          StreamBuilder<List<FinancasRecord>>(
                                        stream: queryFinancasRecord(
                                          queryBuilder: (financasRecord) =>
                                              financasRecord
                                                  .where('uid',
                                                      isEqualTo: currentUserUid)
                                                  .orderBy('mes'),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          List<FinancasRecord>
                                              chartFinancasRecordList =
                                              snapshot.data!;
                                          return Container(
                                            width: 10,
                                            height: 300,
                                            child: FlutterFlowLineChart(
                                              data: [
                                                FFLineChartData(
                                                  xData: functions.graficoMes(),
                                                  yData: functions.graficoLinha(
                                                      chartFinancasRecordList
                                                          .toList())!,
                                                  settings: LineChartBarData(
                                                    color: Color(0xFF5A41C6),
                                                    barWidth: 1,
                                                  ),
                                                )
                                              ],
                                              chartStylingInfo:
                                                  ChartStylingInfo(
                                                enableTooltip: true,
                                                tooltipBackgroundColor:
                                                    Colors.black,
                                                backgroundColor:
                                                    Color(0x00FFFFFF),
                                                showGrid: true,
                                                showBorder: false,
                                              ),
                                              axisBounds: AxisBounds(
                                                minX: 1,
                                                maxX: 12,
                                              ),
                                              xAxisLabelInfo: AxisLabelInfo(
                                                title: 'Mês',
                                                titleTextStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                                showLabels: true,
                                                labelTextStyle: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                labelInterval: 1,
                                              ),
                                              yAxisLabelInfo: AxisLabelInfo(
                                                title: 'Dinheiro',
                                                titleTextStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                                showLabels: true,
                                                labelTextStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                                labelInterval: 200000,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Grafico Qtd Total',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 10, 10),
                                      child:
                                          StreamBuilder<List<FinancasRecord>>(
                                        stream: queryFinancasRecord(
                                          queryBuilder: (financasRecord) =>
                                              financasRecord.where('uid',
                                                  isEqualTo: currentUserUid),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          List<FinancasRecord>
                                              chartFinancasRecordList =
                                              snapshot.data!;
                                          return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 300,
                                            child: Stack(
                                              children: [
                                                FlutterFlowPieChart(
                                                  data: FFPieChartData(
                                                    values: functions
                                                        .graficoCirculoValores(
                                                            chartFinancasRecordList
                                                                .toList()),
                                                    colors: pieChartColorsList,
                                                    radius: [100],
                                                  ),
                                                  donutHoleRadius: 0,
                                                  donutHoleColor:
                                                      Color(0x00FFFFFF),
                                                  sectionLabelType:
                                                      PieChartSectionLabelType
                                                          .percent,
                                                  sectionLabelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .title3,
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.55, -0.85),
                                                  child:
                                                      FlutterFlowChartLegendWidget(
                                                    entries: functions
                                                        .graficoCirculoNomes()!
                                                        .asMap()
                                                        .entries
                                                        .map(
                                                          (label) =>
                                                              LegendEntry(
                                                            pieChartColorsList[label
                                                                    .key %
                                                                pieChartColorsList
                                                                    .length],
                                                            label.value,
                                                          ),
                                                        )
                                                        .toList(),
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1,
                                                    textPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    borderColor:
                                                        Colors.transparent,
                                                    indicatorSize: 10,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Grafico Gasto por Categoria',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 10, 10),
                                      child:
                                          StreamBuilder<List<FinancasRecord>>(
                                        stream: queryFinancasRecord(
                                          queryBuilder: (financasRecord) =>
                                              financasRecord
                                                  .where('uid',
                                                      isEqualTo: currentUserUid)
                                                  .orderBy('categoria'),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          List<FinancasRecord>
                                              chartFinancasRecordList =
                                              snapshot.data!;
                                          return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 300,
                                            child: FlutterFlowBarChart(
                                              barData: [
                                                FFBarChartData(
                                                  yData: functions
                                                      .graficoBarraValores(
                                                          chartFinancasRecordList
                                                              .toList()),
                                                  color: Color(0xFFA31E21),
                                                )
                                              ],
                                              xLabels:
                                                  functions.graficoBarraNomes(
                                                      chartFinancasRecordList
                                                          .toList()),
                                              barWidth: 25,
                                              barBorderRadius:
                                                  BorderRadius.circular(0),
                                              groupSpace: 60,
                                              chartStylingInfo:
                                                  ChartStylingInfo(
                                                enableTooltip: true,
                                                tooltipBackgroundColor:
                                                    Colors.black,
                                                backgroundColor:
                                                    Color(0x00FFFFFF),
                                                showGrid: true,
                                                showBorder: false,
                                              ),
                                              axisBounds: AxisBounds(),
                                              xAxisLabelInfo: AxisLabelInfo(
                                                showLabels: true,
                                                labelTextStyle: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                labelInterval: 10,
                                              ),
                                              yAxisLabelInfo: AxisLabelInfo(
                                                title: 'Dinheiro',
                                                titleTextStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                                showLabels: true,
                                                labelTextStyle: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                labelInterval: 200000,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: SelectionArea(
                                            child: Text(
                                          'Relatorio',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                              ),
                                        )),
                                      ),
                                      GridView(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 50,
                                          mainAxisSpacing: 5,
                                          childAspectRatio: 3,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          SelectionArea(
                                              child: Text(
                                            'Ganho',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          )),
                                          SelectionArea(
                                              child: Text(
                                            'Gasto',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          )),
                                          SelectionArea(
                                              child: Text(
                                            'Data',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          )),
                                        ],
                                      ),
                                      StreamBuilder<List<FinancasRecord>>(
                                        stream: queryFinancasRecord(
                                          queryBuilder: (financasRecord) =>
                                              financasRecord
                                                  .where('uid',
                                                      isEqualTo: currentUserUid)
                                                  .orderBy('data',
                                                      descending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          List<FinancasRecord>
                                              listViewFinancasRecordList =
                                              snapshot.data!;
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewFinancasRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewFinancasRecord =
                                                  listViewFinancasRecordList[
                                                      listViewIndex];
                                              return GridView(
                                                padding: EdgeInsets.zero,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  crossAxisSpacing: 50,
                                                  mainAxisSpacing: 5,
                                                  childAspectRatio: 3,
                                                ),
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                children: [
                                                  if ('id' == '0')
                                                    Text(
                                                      listViewFinancasRecord
                                                          .idFinanca!
                                                          .toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  SelectionArea(
                                                      child: Text(
                                                    listViewFinancasRecord
                                                        .ganho!
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  )),
                                                  SelectionArea(
                                                      child: Text(
                                                    listViewFinancasRecord
                                                        .gasto!
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  )),
                                                  SelectionArea(
                                                      child: Text(
                                                    dateTimeFormat(
                                                      'd/M H:mm',
                                                      listViewFinancasRecord
                                                          .data!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  )),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) =>
                            usersRecord.where('uid', isEqualTo: currentUserUid),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> listViewUsersRecordList =
                            snapshot.data!;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final listViewUsersRecord =
                            listViewUsersRecordList.isNotEmpty
                                ? listViewUsersRecordList.first
                                : null;
                        return ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            if (listViewUsersRecord!.financa == 0)
                              FFButtonWidget(
                                onPressed: () async {
                                  final financasCreateData =
                                      createFinancasRecordData(
                                    uid: currentUserUid,
                                    ganho: 0,
                                    gasto: 0,
                                    total: 0,
                                    data: getCurrentTimestamp,
                                    mes: 0,
                                    idFinanca: 0,
                                  );
                                  await FinancasRecord.collection
                                      .doc()
                                      .set(financasCreateData);

                                  final usersUpdateData = createUsersRecordData(
                                    financa: 1,
                                  );
                                  await listViewUsersRecord!.reference
                                      .update(usersUpdateData);

                                  context.pushNamed(
                                    'MinhasFinancas',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.bottomToTop,
                                        duration: Duration(milliseconds: 200),
                                      ),
                                    },
                                  );
                                },
                                text: 'Gerar Finança',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 100,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
          ),
        ),
      ),
    );
  }
}
