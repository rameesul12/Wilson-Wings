

//password checking 
Future validPassword(String password)async{
  
  if (password.length==6) {
    return true;
  }
  return false;

 }
 