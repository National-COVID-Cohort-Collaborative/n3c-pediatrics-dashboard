<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$.getJSON("feeds/patient_group.jsp", function(data){
		
	var json = $.parseJSON(JSON.stringify(data));

	var col = [];

	for (i in json['headers']){
		col.push(json['headers'][i]['label']);
	}


	var table = document.createElement("table");
	table.className = 'table table-hover';
	table.style.width = '75%';
	table.style.textAlign = "center";
	table.id="patient-group-table";

	var header= table.createTHead();
	var header_row = header.insertRow(0); 

	for (i in col) {
		var th = document.createElement("th");
		th.innerHTML = '<span style="color:#333; font-weight:600; font-size:16px;">' + col[i].toString() + '</span>';
		header_row.appendChild(th);
	}

	var divContainer = document.getElementById("patient-group");
	divContainer.innerHTML = "";
	divContainer.appendChild(table);

	var data = json['rows'];

	$('#patient-group-table').DataTable( {
    	data: data,
       	paging: false,
       	info: false,
       	searching: false,
    	order: [[0, 'asc']],
     	columns: [
        	{ data: 'date',
              visible: false,
              orderable: false,
             },
         	{ data: 'month_year_factor',
              visible: true,
              orderable: false,
             },
        	{ data: 'child',
              visible: true,
           	  orderable: false
        	 },
          	{ data: 'tween',
        	  visible: true,
        	  orderable: false
        	 },
          	{ data: 'teen',
        	  visible: true,
        	  orderable: false
        	 }
    	]
	} );

	
});
</script>
