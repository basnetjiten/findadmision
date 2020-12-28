import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum StepState {
  indexed,
  editing,
  complete,
  disabled,
}

const TextStyle _kStepStyle = TextStyle(
    fontSize: 14.0,
    color: AppTheme.btnBorderColor,
    fontWeight: FontWeight.w700);
const Color _kCircleActiveLight = Colors.white;
const Color _kCircleActiveDark = Colors.black87;

const double _kStepSize = 40.0;

@immutable
class CustomStep {
  /// Creates a step for a [CustomStepper].
  ///
  /// The [title], [content], and [state] arguments must not be null.
  const CustomStep({
    @required this.stepNumber,
    @required this.title,
    this.subtitle,
    // @required this.content,
    this.state = StepState.indexed,
    this.isActive = false,
  })  : assert(title != null),
        //assert(content != null),
        assert(state != null);

  /// The title of the step that typically describes it.
  final String title;
  final int stepNumber;

  final String subtitle;

  final StepState state;

  final bool isActive;
}

class CustomStepper extends StatefulWidget {
  const CustomStepper({
    Key key,
    @required this.steps,
    this.physics,
    this.currentStep = 0,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.controlsBuilder,
  })  : assert(steps != null),
        assert(currentStep != null),
       // assert(0 <= currentStep && currentStep < steps.length),
        super(key: key);

  final List<CustomStep> steps;
  final ScrollPhysics physics;
  final int currentStep;

  final ValueChanged<int> onStepTapped;

  final VoidCallback onStepContinue;

  final VoidCallback onStepCancel;
  final ControlsWidgetBuilder controlsBuilder;

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper>
    with TickerProviderStateMixin {
  List<GlobalKey> _keys;
  final Map<int, StepState> _oldStates = <int, StepState>{};

  @override
  void initState() {
    super.initState();
    _keys = List<GlobalKey>.generate(
      widget.steps.length,
      (int i) => GlobalKey(),
    );

    for (int i = 0; i < widget.steps.length; i += 1)
      _oldStates[i] = widget.steps[i].state;
  }

  @override
  void didUpdateWidget(CustomStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(widget.steps.length == oldWidget.steps.length);

    for (int i = 0; i < oldWidget.steps.length; i += 1)
      _oldStates[i] = oldWidget.steps[i].state;
  }

  bool _isDark() {
    return Theme.of(context).brightness == Brightness.dark;
  }

  Widget _buildCircleChild(int index, bool oldState) {
    final StepState state =
        oldState ? _oldStates[index] : widget.steps[index].state;
    final bool isDarkActive = _isDark() || widget.steps[index].isActive;
    assert(state != null);
    switch (state) {
      case StepState.indexed:
      case StepState.disabled:
        return Text(

          '${widget.steps[index].stepNumber }',
          style: isDarkActive
              ? _kStepStyle.copyWith(color: Colors.white)
              : _kStepStyle,
          textScaleFactor: 1.0,
        );
      case StepState.editing:
        return Icon(
          Icons.edit,
          color: isDarkActive ? _kCircleActiveDark : _kCircleActiveLight,
          size: 18.0,
        );
      case StepState.complete:
        return Icon(
          Icons.check,
          color: isDarkActive ? _kCircleActiveDark : _kCircleActiveLight,
          size: 18.0,
        );
    }
    return null;
  }

  BoxDecoration _buildDecoration(int index) {
    final ThemeData themeData = Theme.of(context);
    if (!_isDark()) {
      return widget.steps[index].isActive
          ? BoxDecoration(
              color: AppTheme.checkBoxCheckedColor,
          shape: BoxShape.circle)
          : BoxDecoration(
              border: Border.all(color: AppTheme.btnBorderColor),
          shape: BoxShape.circle,
              color: Colors.white,
            );
    } else {
      return widget.steps[index].isActive
          ? BoxDecoration(
              color: AppTheme.checkBoxCheckedColor,
        shape: BoxShape.circle,
            )
          : BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppTheme.greyBackground),
        shape: BoxShape.circle,
            );
    }
  }

  Widget _buildCircle(int index, bool oldState) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: _kStepSize,
      height: _kStepSize,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        decoration: _buildDecoration(index),
        child: Center(
          child: _buildCircleChild(index, oldState),
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
    if (widget.steps[index].state != _oldStates[index]) {
      return AnimatedCrossFade(
        firstChild: _buildCircle(index, true),
        secondChild: _buildCircle(index, true),
        firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
        secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
        sizeCurve: Curves.fastOutSlowIn,
        crossFadeState: CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      );
    } else {
      return _buildCircle(index, false);
    }
  }

  Widget _buildHeaderText(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "${widget.steps[index].title}",
          style: TextStyle(
              color: Color(0xff191919),
              fontSize: 12.0,
              fontWeight: FontWeight.w400),
         textScaleFactor: 1.0,
         // duration: kThemeAnimationDuration,
         // curve: Curves.fastOutSlowIn,

        ),
        if (widget.steps[index].subtitle != null)
          Container(
            //margin: const EdgeInsets.only(top: 1.0),
            width: 90,
            child: Text(
              "${widget.steps[index].subtitle}",
              style: TextStyle(
                  color: Color(0xff191919),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w800),
             textScaleFactor: 1.0,
             // duration: kThemeAnimationDuration,
              //curve: Curves.fastOutSlowIn,
              //child: ,
            ),
          ),
      ],
    );
  }

  Widget _buildHorizontal() {
    final List<Widget> children = <Widget>[
      for (int i = 0; i < widget.steps.length; i += 1) ...<Widget>[
        InkResponse(
          onTap: widget.steps[i].state != StepState.disabled
              ? () {
                  if (widget.onStepTapped != null) widget.onStepTapped(i);
                }
              : null,
          canRequestFocus: widget.steps[i].state != StepState.disabled,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Container(
                height: 72.0,

                child: Center(
                  child: _buildIcon(i),
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(start: 12.0),
                child: _buildHeaderText(i),
              ),
              SizedBox(
                width: 4,
              )
            ],
          ),
        ),

      ],
    ];

    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Material(
          color: Colors.white,
          elevation: 0.0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: children,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    assert(() {
      if (context.findAncestorWidgetOfExactType<CustomStepper>() != null)
        throw FlutterError('CustomSteppers must not be nested.\n'
            'The material specification advises that one should avoid embedding '
            'steppers within steppers. '
            'https://material.io/archive/guidelines/components/steppers.html#steppers-usage');
      return true;
    }());

    return _buildHorizontal();
  }
}


