import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cr-acc-term.dart';
import '../../UI widgets/gradient-bg.dart';
import '../../UI widgets/cr-acc-appbar.dart';

class CreateAccountPassword extends StatefulWidget {
  @override
  _CreateAccountPasswordState createState() => _CreateAccountPasswordState();
}

class _CreateAccountPasswordState extends State<CreateAccountPassword> {
  final Map<String, dynamic> _formData = {
    'password': null,
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _icons = {
    'eye': 'assets/icon/open_eye.svg',
    'correct': 'assets/icon/correct.svg',
    'uncorrect': 'assets/icon/uncorrect.svg',
  };
  bool _obscure = true;
  final TextEditingController _passwordTxtCtrl = TextEditingController();
  final TextEditingController _cfPasswordTxtCtrl = TextEditingController();
  bool _isCorrectPasswordConfirm = false;

  Widget _buildHeading() {
    return Center(
      child: Text(
        'Choose a Password',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget _buildBodyText() {
    return Center(
      child: Container(
        height: 100,
        width: 300,
        child: Text(
          'Create a password with 6 numbers. It should be something other couldn\'t guest.',
          style: Theme.of(context).textTheme.bodyText2,
          maxLines: 3,
        ),
      ),
    );
  }

  Widget _buildToggleObscurePasswordButton() {
    return Container(
      margin: EdgeInsets.only(right: 5),
      child: IconButton(
        onPressed: _toggleObscurePw,
        icon: SvgPicture.asset(
          _icons['eye'],
          color: Theme.of(context).backgroundColor,
        ),
        iconSize: 40,
      ),
    );
  }

  void _toggleObscurePw() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  Widget _buildPasswordInput() {
    return Center(
      child: Container(
        width: 300,
        child: TextFormField(
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
            hintText: "●●●●●●",
            //counterText: "",
            counterStyle: TextStyle(
              fontSize: 10.0,
              color: Color.fromRGBO(0, 0, 0, .5),
            ),
            hintStyle: Theme.of(context).textTheme.bodyText1,
            prefixIcon: Container(
              width: 10,
            ),
            suffixIcon: _buildToggleObscurePasswordButton(),
            filled: true,
            fillColor: Colors.white.withOpacity(.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(45),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(6),
          ],
          obscureText: _obscure,
          controller: _passwordTxtCtrl,
          validator: (String value) {
            if (value.isEmpty ||
                value.trim().length < 6 ||
                //value must be a number
                !RegExp(r'^(?:[1-9]\d*|0)?$').hasMatch(value)) {
              return 'Password is not correct.';
            }
            return null;
          },
          onSaved: (String value) {
            _formData['password'] = value;
          },
          onChanged: (String value) {
            setState(() {
              if (value != _cfPasswordTxtCtrl.text) {
                _isCorrectPasswordConfirm = false;
              } else {
                _isCorrectPasswordConfirm = true;
              }
            });
          },
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordInput() {
    return Center(
      child: Container(
        width: 300,
        child: TextFormField(
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
            hintText: "●●●●●●",
            //counterText: "",
            counterStyle: TextStyle(
              fontSize: 10.0,
              color: Color.fromRGBO(0, 0, 0, .5),
            ),
            hintStyle: Theme.of(context).textTheme.bodyText1,
            prefixIcon: Container(
              width: 10,
            ),
            suffixIcon: Container(
              margin: EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                _isCorrectPasswordConfirm == false
                    ? _icons['uncorrect']
                    : _icons['correct'],
              ),
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(45),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(6),
          ],
          obscureText: _obscure,
          controller: _cfPasswordTxtCtrl,
          validator: (String value) {
            if (value != _passwordTxtCtrl.text) {
              return 'Password do not match.';
            }
            return null;
          },
          onChanged: (String value) {
            setState(() {
              if (value != _passwordTxtCtrl.text) {
                _isCorrectPasswordConfirm = false;
              } else {
                _isCorrectPasswordConfirm = true;
              }
            });
          },
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Center(
      child: Container(
        width: 300,
        height: 65,
        child: ElevatedButton(
          child: Text(
            'Next',
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: () => _submitForm(), //model.authenticate),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => CreateAccountTerm(),
      ),
    );
  }

  Widget _buildBodyWidget() {
    final List<Widget> _widgets = [
      SizedBox(height: 20),
      _buildHeading(),
      SizedBox(height: 10),
      _buildBodyText(),
      SizedBox(height: 10),
      _buildPasswordInput(),
      SizedBox(height: 20),
      _buildConfirmPasswordInput(),
      SizedBox(height: 40),
      _buildNextButton(),
    ];
    return Form(
      key: _formKey,
      child: Container(
        child: ListView(
          children: _widgets,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSize _appBar = PreferredSize(
      preferredSize: Size.fromHeight(65),
      child: CAAppBar('Password'),
    );

    return GradientBackground(_buildBodyWidget(), context, _appBar);
  }
}
