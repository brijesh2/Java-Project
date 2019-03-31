function Validation() {
	var id= document.getElementById("uname");
	var pass=document.getElementById("pword");
	if(id.value.length<=0){
		alert("please Enter user name");
		return false;
	}
	else if(pass.value.length<=0){
		alert("please Enter password");
		return false;
	}
	return true;
};

function abc(){ 
	 document.getElementById("option1").style.display="block"; 
	 document.getElementById("option2").style.display="none"; 
	 document.getElementById("option3").style.display="none"; 
	 document.getElementById("option4").style.display="none"; 
	 document.getElementById("option5").style.display="none"; 
	 document.getElementById("default").style.display="none";
	 
	 } 
	  
	function xyz(){ 
	 document.getElementById("option2").style.display="block"; 
	 document.getElementById("option1").style.display="none"; 
	 document.getElementById("option3").style.display="none"; 
	 document.getElementById("option4").style.display="none"; 
	 document.getElementById("option5").style.display="none";
	 document.getElementById("default").style.display="none";
	 } 
	function mno(){ 
	 document.getElementById("option3").style.display="block"; 
	 document.getElementById("option1").style.display="none"; 
	 document.getElementById("option2").style.display="none"; 
	 document.getElementById("option4").style.display="none"; 
	 document.getElementById("option5").style.display="none"; 
	 document.getElementById("default").style.display="none";
	 } 
	function pqr(){ 
		 document.getElementById("option4").style.display="block"; 
		 document.getElementById("option1").style.display="none"; 
		 document.getElementById("option2").style.display="none";
		 document.getElementById("option3").style.display="none"; 
		 document.getElementById("option5").style.display="none"; 
		 document.getElementById("default").style.display="none";
		 }
	function lmn(){ 
		 document.getElementById("option5").style.display="block"; 
		 document.getElementById("option1").style.display="none"; 
		 document.getElementById("option2").style.display="none";
		 document.getElementById("option3").style.display="none"; 
		 document.getElementById("option4").style.display="none";
		 document.getElementById("default").style.display="none";
		 }

function sortTable() {
	  var table, rows, switching, i, x, y, shouldSwitch;
	  table = document.getElementById("myTable");
	  switching = true;
	  while (switching) {
	    switching = false;
	    rows = table.rows;
	    for (i = 1; i < (rows.length - 1); i++) {
	      shouldSwitch = false;
	      x = rows[i].getElementsByTagName("TD")[0];
	      y = rows[i + 1].getElementsByTagName("TD")[0];
	      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
	        shouldSwitch = true;
	        break;
	      }
	    }
	    if (shouldSwitch) {
	      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
	      switching = true;
	    }
	  }
	}