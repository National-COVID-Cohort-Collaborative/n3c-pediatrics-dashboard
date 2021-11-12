<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" flush="true" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="resources/MT.BootstrapLazyloader.js"></script>
	<link href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" rel="stylesheet">
	<script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>

<script src="resources/d3.v4.min.js"></script>
<script src="resources/d3-tip.js"></script>

<style type="text/css" media="all">
@import "resources/n3c_login_style.css";
@import "resources/main_style.css";
</style>

<style type="text/css">
table.dataTable thead .sorting_asc {
	background-image: none !important;
}

.centered{
	text-align:center;
}

.large-mb{
	margin-bottom:50px;
}
</style>

<body>

	<jsp:include page="navbar.jsp" flush="true" />

<div class="container-fluid">
	<h2 class="header-text">
		<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Pediatrics Dashboard
	</h2>
	
	<div class="row large-mb">
		<div class="col-xs-12 centered">
			<h3>COVID-19 Disease Severity</h3>
			<p>Click on an image to zoom.</p>
		</div>
		<div class="col-xs-12, col-md-6">
			<h4 class="centered">Pediatrics</h4>
			<a href="downloads/ped_severity.svg"><img alt="test image" src="downloads/ped_severity.svg" width="100%"></a>
		</div>
		<div class="col-xs-12, col-md-6">
			<h4 class="centered">Adult</h4>
			<a href="downloads/adult_severity.svg"><img alt="test image" src="downloads/adult_severity.svg" width="100%"></a>
		</div>
	</div>
	
	<div class="row">
		<div class="col-xs-12 centered">
			<h3 class="centered">Patient Counts Over Time</h3>
		</div>
		<div class="col-xs-6">
			<div>
				<div id="stacked_bar">
					<jsp:include page="stacked_bar.jsp">
						<jsp:param name="data_page" value="feeds/stacked_bar_data.jsp" />
						<jsp:param name="dom_element" value="#stacked_bar" />
					</jsp:include>
				</div>
			</div>
		<div class="centered">
			<p>(Patient counts less than 20 have been removed.)</p>
		</div>
		</div>
		<div class="col-xs-6">
			<div id="patient-group"></div>
			<jsp:include page="tables/patient_counts.jsp"/>
		</div>
	</div>
</div>
	
<div style="float: left; width: 100%">
	<jsp:include page="footer.jsp" flush="true" />
	</div>
</body>
</html>
