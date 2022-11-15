import 'package:form_bloc/form_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CrudFormBloc extends FormBloc<String, String> {
  final TextFieldBloc messageField;
  final TextFieldBloc caption1Field;
  final TextFieldBloc caption2Field;
  final TextFieldBloc headerFontSizeField;
  final TextFieldBloc bodyFontSizeField;
  final SelectFieldBloc<String> col1ATypeField;
  final TextFieldBloc col1AOffsetField;
  final TextFieldBloc col1ACountField;
  final SelectFieldBloc<String> col1BTypeField;
  final TextFieldBloc col1BOffsetField;
  final TextFieldBloc col1BCountField;
  final SelectFieldBloc<String> col2ATypeField;
  final TextFieldBloc col2AOffsetField;
  final TextFieldBloc col2ACountField;
  final SelectFieldBloc<String> col2BTypeField;
  final TextFieldBloc col2BOffsetField;
  final TextFieldBloc col2BCountField;
  
  CrudFormBloc(
    {
    String message='',
    String caption1='คิวรับยา',
    String caption2='คิวรับยา',
    double headerFontSize=30.0,double bodyFontSize=24.0,
    String col1AType='Que-1',int col1AOffset=1,int col1ACount=30,
    String col1BType='Que-4',int col1BOffset=1,int col1BCount=30,
    String col2AType='Que-5',int col2AOffset=1,int col2ACount=30,
    String col2BType='Urgent-Que',int col2BOffset=1,int col2BCount=30,
    }
    )
    : messageField = TextFieldBloc(initialValue: message),
      caption1Field = TextFieldBloc(initialValue: caption1),
      caption2Field = TextFieldBloc(initialValue: caption2),
      headerFontSizeField = TextFieldBloc(initialValue: headerFontSize.toString(),validators: [
          FieldBlocValidators.requiredTextFieldBloc]),
      bodyFontSizeField = TextFieldBloc(initialValue: bodyFontSize.toString(),validators: [
          FieldBlocValidators.requiredTextFieldBloc]),
      col1ATypeField = SelectFieldBloc(initialValue:col1AType,items: ['NotUsed','Que-1','Que-4','Que-5','Que-8','Que-9','Urgent-Que']), 
      col1AOffsetField = TextFieldBloc(initialValue: col1AOffset.toString(),validators: [
          FieldBlocValidators.requiredTextFieldBloc]),
      col1ACountField = TextFieldBloc(initialValue: col1ACount.toString(),validators: [
          FieldBlocValidators.requiredTextFieldBloc]),
      col1BTypeField = SelectFieldBloc(initialValue:col1BType,items: ['NotUsed','Que-1','Que-4','Que-5','Que-8','Que-9','Urgent-Que']), 
      col1BOffsetField = TextFieldBloc(initialValue: col1BOffset.toString(),validators: [
          FieldBlocValidators.requiredTextFieldBloc]),
      col1BCountField = TextFieldBloc(initialValue: col1BCount.toString(),validators: [
          FieldBlocValidators.requiredTextFieldBloc]),
      col2ATypeField = SelectFieldBloc(initialValue:col2AType,items: ['NotUsed','Que-1','Que-4','Que-5','Que-8','Que-9','Urgent-Que']), 
      col2AOffsetField = TextFieldBloc(initialValue: col2AOffset.toString(),validators: [
          FieldBlocValidators.requiredTextFieldBloc]),
      col2ACountField = TextFieldBloc(initialValue: col2ACount.toString(),validators: [
          FieldBlocValidators.requiredTextFieldBloc]),
      col2BTypeField = SelectFieldBloc(initialValue:col2BType,items: ['NotUsed','Que-1','Que-4','Que-5','Que-8','Que-9','Urgent-Que']), 
      col2BOffsetField = TextFieldBloc(initialValue: col2BOffset.toString(),validators: [
          FieldBlocValidators.requiredTextFieldBloc]),
      col2BCountField = TextFieldBloc(initialValue: col2BCount.toString(),validators: [
          FieldBlocValidators.requiredTextFieldBloc]),
      super(isEditing: message!= null);


  @override
  List<FieldBloc> get fieldBlocs => [
    messageField,caption1Field,caption2Field,
    headerFontSizeField,bodyFontSizeField,
    col1ATypeField,col1AOffsetField,col1ACountField,
    col1BTypeField,col1BOffsetField,col1BCountField,
    col2ATypeField,col2AOffsetField,col2ACountField,
    col2BTypeField,col2BOffsetField,col2BCountField
    ];

  set fontSize(double fontSize) {}

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    if (state.isEditing) {
      try {
        // Update logic...
        //print('update logic');
        //print(headerFontSizeField.value);
        //print(col1ATypeField.value);
        //print(col1AOffsetField.value);
        //print(col1ACountField.value);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('message', messageField.value);
        prefs.setString('caption1', caption1Field.value);
        prefs.setString('caption2', caption2Field.value);
        prefs.setDouble('headerFontSize', headerFontSizeField.valueToDouble);
        prefs.setDouble('bodyFontSize', bodyFontSizeField.valueToDouble);
        prefs.setString('col1AType', col1ATypeField.value);
        prefs.setInt('col1AOffset', col1AOffsetField.valueToInt);
        prefs.setInt('col1ACount', col1ACountField.valueToInt);
        prefs.setString('col1BType', col1BTypeField.value);
        prefs.setInt('col1BOffset', col1BOffsetField.valueToInt);
        prefs.setInt('col1BCount', col1BCountField.valueToInt);
        prefs.setString('col2AType', col2ATypeField.value);
        prefs.setInt('col2AOffset', col2AOffsetField.valueToInt);
        prefs.setInt('col2ACount', col2ACountField.valueToInt);
        prefs.setString('col2BType', col2BTypeField.value);
        prefs.setInt('col2BOffset', col2BOffsetField.valueToInt);
        prefs.setInt('col2BCount', col2BCountField.valueToInt);

        // throw Exception();
        yield state.toSuccess();
        yield state.toLoaded();
      } catch (e) {
        yield state.toFailure();
      }
    } else {
      try {
        // Create logic...

        // Fake exception...
        // throw Exception();

        yield state.toSuccess();
        yield state.toLoaded(isEditing: false);
      } catch (e) {
        yield state.toFailure();
      }
    }
  }

  @override
  Stream<FormBlocState<String, String>> onDelete() async* {
    try {
      // Delete Logic...
      await Future.delayed(Duration(milliseconds: 1000));

      // Fake exception...
      // throw Exception();

      yield state.toDeleteSuccessful();
    } catch (e) {
      yield state.toDeleteFailed();
    }
  }
}
