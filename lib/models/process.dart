class ProcessModel {
  bool isDone = false;
  bool isFail = false;
  String loadingWord = '';
  String doneWord = '';
  String failWord = '';
  bool isQuestion = false;

  ProcessModel({ this.loadingWord, this.doneWord, this.failWord, this.isDone, this.isFail });
}
