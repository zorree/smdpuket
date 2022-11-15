class Configuration {
  String message;
  String caption1;
  String caption2;
  double headerFontSize;
  double bodyFontSize;
  String col1AType;
  int col1AOffset;
  int col1ACount;
  String col1BType;
  int col1BOffset;
  int col1BCount;
  String col2AType;
  int col2AOffset;
  int col2ACount;
  String col2BType;
  int col2BOffset;
  int col2BCount;
  Configuration(
    {this.message,this.caption1,this.caption2,
    this.headerFontSize,this.bodyFontSize,
    this.col1AType,this.col1AOffset,this.col1ACount,
    this.col1BType,this.col1BOffset,this.col1BCount,
    this.col2AType,this.col2AOffset,this.col2ACount,
    this.col2BType,this.col2BOffset,this.col2BCount,
    }
    );
}