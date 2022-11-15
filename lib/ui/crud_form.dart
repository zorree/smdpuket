import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:VachiraDash/model/configuration.dart';
import 'package:VachiraDash/ui/widgets/widgets.dart';

import 'crud_form_bloc.dart';

class CrudForm extends StatelessWidget {
  final Configuration configuration;
  
  const CrudForm({Key key, this.configuration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('font size='+configuration.headerFontSize.toString());
    return BlocProvider<CrudFormBloc>(
      create: (context) 
        => CrudFormBloc(
          message: configuration.message,
          caption1: configuration.caption1,
          caption2: configuration.caption2,
          headerFontSize: configuration.headerFontSize,
          bodyFontSize: configuration.bodyFontSize,
          col1AType: configuration.col1AType,
          col1AOffset: configuration.col1AOffset,
          col1ACount: configuration.col1ACount,
          col1BType: configuration.col1BType,
          col1BOffset: configuration.col1BOffset,
          col1BCount: configuration.col1BCount,
          col2AType: configuration.col2AType,
          col2AOffset: configuration.col2AOffset,
          col2ACount: configuration.col2ACount,
          col2BType: configuration.col2BType,
          col2BOffset: configuration.col2BOffset,
          col2BCount: configuration.col2BCount
          ),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<CrudFormBloc>(context);

          return Scaffold(
            appBar: AppBar(title: Text('ตั้งค่าระบบ')),
            body: FormBlocListener<CrudFormBloc, String, String>(
              onSubmitting: (context, state) => LoadingDialog.show(context),
              onSuccess: (context, state) {
                LoadingDialog.hide(context);
                Notifications.showSnackBarWithSuccess(
                    context, state.isEditing ? 'Updated!' : 'Created!');
              },
              onFailure: (context, state) {
                LoadingDialog.hide(context);
                Notifications.showSnackBarWithError(
                    context,
                    state.isEditing
                        ? 'Error trying to create'
                        : 'Error trying to update');
              },
              onDeleting: (context, state) => LoadingDialog.show(context),
              onDeleteFailed: (context, state) {
                LoadingDialog.hide(context);

                Notifications.showSnackBarWithError(context, 'Delete Failed');
              },
              onDeleteSuccessful: (context, state) {
                LoadingDialog.hide(context);
                Navigator.of(context).pop();
                Notifications.showSnackBarWithSuccess(
                    context, 'Deleted Successful!');
              },
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  TextFieldBlocBuilder(
                    textFieldBloc: formBloc.messageField,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'ข้อความประกาศ',
                      prefixIcon: Icon(Icons.message),
                    ),
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: formBloc.caption1Field,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'ประเภทคิวแถวที่ 1',
                      prefixIcon: Icon(Icons.watch),
                    ),
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: formBloc.caption2Field,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'ประเภทคิวแถวที่ 2',
                      prefixIcon: Icon(Icons.watch),
                    ),
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: formBloc.headerFontSizeField,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'ขนาดตัวอักษรส่วนหัว',
                      prefixIcon: Icon(Icons.font_download),
                    ),
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: formBloc.bodyFontSizeField,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'ขนาดตัวอักษรข้อมูล',
                      prefixIcon: Icon(Icons.font_download),
                    ),
                  ),
                  /* RadioButtonGroupFieldBlocBuilder<String>(
                    selectFieldBloc: formBloc.col1ATypeField ,
                    decoration: InputDecoration(
                      labelText: 'ประเภทคิวแถวที่ 1A',
                      prefixIcon: Icon(Icons.merge_type),
                    ),
                    itemBuilder: (context, item) => item,
                  ), */
                  DropdownFieldBlocBuilder<String>(
                    selectFieldBloc: formBloc.col1ATypeField ,
                    millisecondsForShowDropdownItemsWhenKeyboardIsOpen: 320,
                    decoration: InputDecoration(
                      labelText: 'ประเภทคิวแถวที่ 1A',
                      prefixIcon: Icon(Icons.merge_type),
                    ),
                    itemBuilder: (context, item) => item,
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: formBloc.col1AOffsetField,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'ลำดับคิวเริ่มต้นแถวที่ 1A',
                      prefixIcon: Icon(Icons.font_download),
                    ),
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: formBloc.col1ACountField,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'จำนวนคิวแถวที่ 1A',
                      prefixIcon: Icon(Icons.font_download),
                    ),
                  ),
                  DropdownFieldBlocBuilder<String>(
                    selectFieldBloc: formBloc.col1BTypeField ,
                    millisecondsForShowDropdownItemsWhenKeyboardIsOpen: 320,
                    decoration: InputDecoration(
                      labelText: 'ประเภทคิวแถวที่ 1B',
                      prefixIcon: Icon(Icons.merge_type),
                    ),
                    itemBuilder: (context, item) => item,
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: formBloc.col1BOffsetField,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'ลำดับคิวเริ่มต้นแถวที่ 1B',
                      prefixIcon: Icon(Icons.font_download),
                    ),
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: formBloc.col1BCountField,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'จำนวนคิวแถวที่ 1B',
                      prefixIcon: Icon(Icons.font_download),
                    ),
                  ),
                  DropdownFieldBlocBuilder<String>(
                    selectFieldBloc: formBloc.col2ATypeField ,
                    millisecondsForShowDropdownItemsWhenKeyboardIsOpen: 320,
                    decoration: InputDecoration(
                      labelText: 'ประเภทคิวแถวที่ 2A',
                      prefixIcon: Icon(Icons.merge_type),
                    ),
                    itemBuilder: (context, item) => item,
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: formBloc.col2AOffsetField,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'ลำดับคิวเริ่มต้นแถวที่ 2A',
                      prefixIcon: Icon(Icons.font_download),
                    ),
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: formBloc.col2ACountField,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'จำนวนคิวแถวที่ 2A',
                      prefixIcon: Icon(Icons.font_download),
                    ),
                  ),
                  DropdownFieldBlocBuilder<String>(
                    selectFieldBloc: formBloc.col2BTypeField ,
                    millisecondsForShowDropdownItemsWhenKeyboardIsOpen: 320,
                    decoration: InputDecoration(
                      labelText: 'ประเภทคิวแถวที่ 2B',
                      prefixIcon: Icon(Icons.merge_type),
                    ),
                    itemBuilder: (context, item) => item,
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: formBloc.col2BOffsetField,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'ลำดับคิวเริ่มต้นแถวที่ 2B',
                      prefixIcon: Icon(Icons.font_download),
                    ),
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: formBloc.col2BCountField,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'จำนวนคิวแถวที่ 2B',
                      prefixIcon: Icon(Icons.font_download),
                    ),
                  ),
                  BlocBuilder<CrudFormBloc, FormBlocState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: formBloc.submit,
                          child: Center(
                              child:
                                  //Text(state.isEditing ? 'UPDATE' : 'CREATE')),
                                  Text('บันทึก')
                              ),
                        ),
                      );
                    },
                  ),
                  /* BlocBuilder<CrudFormBloc, FormBlocState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: state.isEditing ? formBloc.delete : null,
                          child: Center(child: Text('DELETE')),
                        ),
                      );
                    },
                  ), */
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
