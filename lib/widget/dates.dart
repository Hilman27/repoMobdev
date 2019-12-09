String intDatesToString(int){
  String result;
  if (int==1) {
    result = "Jan";
  }
  else if (int==2) {
    result = "Feb";
  }
  else if (int==3) {
    result = "Mar";
  }
  else if (int==4) {
    result = "Apr";
  }
  else if (int==5) {
    result = "Mei";
  }
  else if (int==6) {
    result = "Jun";
  }
  else if (int==7) {
    result = "Jul";
  }
  else if (int==8) {
    result = "Agu";
  }
  else if (int==9) {
    result = "Sep";
  }
  else if (int==10) {
    result = "Okt";
  }
  else if (int==11) {
    result = "Nov";
  }
  else if (int==12) {
    result = "Des";
  }
  else {
    result = "DataCorrupt";
  }
  return result;
}

