<html>
<head>
<title>N3C Pediatrics Dashboard</title>
</head>
<body>
	<h2>N3C Pediatrics Dashboard</h2>
	<div style="float: left; width: 50%">
		<h3>Patient Count - All Age Groups</h3>
		<div id="registration_line">
			<jsp:include page="line_graph.jsp">
				<jsp:param name="data_page" value="feeds/line_data.jsp" />
				<jsp:param name="dom_element" value="#registration_line" />
			</jsp:include>
		</div>
	</div>
	<div style="float: left; width: 50%">
		<h3>Patient Count - By Age Group</h3>
		<div id="registration_line2">
			<jsp:include page="lines_graph.jsp">
				<jsp:param name="data_page" value="feeds/lines_data.jsp" />
				<jsp:param name="dom_element" value="#registration_line2" />
			</jsp:include>
		</div>
	</div>
	<div style="float: left; width: 80%">
		<p>myexample.svg test image</p>
		<img alt="test image" src="downloads/myexample.svg" width="50%">
	</div>
</body>
</html>