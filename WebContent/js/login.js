function checksame(){

  var pwd=document.getElementById("pwd2").value;
  var confirm=document.getElementById("confirm").value;
  console.log(pwd+confirm);
  if(pwd!=confirm){
  	alert("帳密輸入不一致!");
         return false;
  }else{form.sumbit()}

}
