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

	<c:set var="active_tab" value="severity"/>
	<%  /* valueless parameters are not visible at the JSTL/EL level, so we do some scriptlet magic */
		java.util.Enumeration<String> names = request.getParameterNames();
		while (names.hasMoreElements()) {
			switch(names.nextElement()) {
			case "age":
				pageContext.setAttribute("active_tab", "age");
				break;
			case "coinfection":
				pageContext.setAttribute("active_tab", "coinfection");
				break;
			case "croup":
				pageContext.setAttribute("active_tab", "croup");
				break;
			case "geographic":
				pageContext.setAttribute("active_tab", "geographic");
				break;
			case "diabetes":
				pageContext.setAttribute("active_tab", "diabetes");
				break;
			case "severity":
			default:
				pageContext.setAttribute("active_tab", "severity");
			}
		}
	%>

<div class="container-fluid">
	<h2 class="header-text">
		<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Pediatrics Dashboard
	</h2>

		<ul class="nav nav-tabs" id="maintabs" style="font-size: 16px;">
			<li <c:if test="${active_tab =='severity'}">class="active"</c:if>>
				<a data-toggle="tab" data-src="severity.jsp" href="#severity">Severity Distributions over Time</a>
			</li>
			<li <c:if test="${active_tab =='age'}">class="active"</c:if>>
				<a data-toggle="tab" data-src="age.jsp" href="#age">Age Distributions over Time</a>
			</li>
			<li <c:if test="${active_tab =='coinfection'}">class="active"</c:if>>
				<a data-toggle="tab" data-src="coinfection.jsp" href="#coinfection">Viral Coinfection</a>
			</li>
			<li <c:if test="${active_tab =='geographic'}">class="active"</c:if>>
				<a data-toggle="tab" data-src="geographic.jsp" href="#geographic">Geographic Distribution of Children with COVID-19 in N3C</a>
			</li>
			<li <c:if test="${active_tab =='diabetes'}">class="active"</c:if>>
				<a data-toggle="tab" data-src="diabetes.jsp" href="#diabetes">Diabetes Mellitus</a>
			</li>
			<li <c:if test="${active_tab =='croup'}">class="active"</c:if>>
				<a data-toggle="tab" data-src="croup.jsp" href="#croup">Croup/Tracheitis</a>
			</li>
		</ul>

		<div class="tab-content" id="maintabscontent">
			<div class="tab-pane fade <c:if test="${active_tab =='severity'}">in active</c:if>" id="severity"></div>
			<div class="tab-pane fade <c:if test="${active_tab =='age'}">in active</c:if>" id="age"></div>
			<div class="tab-pane fade <c:if test="${active_tab =='coinfection'}">in active</c:if>" id="coinfection"></div>
			<div class="tab-pane fade <c:if test="${active_tab =='geographic'}">in active</c:if>" id="geographic"></div>
			<div class="tab-pane fade <c:if test="${active_tab =='diabetes'}">in active</c:if>" id="diabetes"></div>
			<div class="tab-pane fade <c:if test="${active_tab =='croup'}">in active</c:if>" id="croup"></div>
		</div>
	
	<div style="float: left; width: 100%">
		<jsp:include page="footer.jsp" flush="true" />
	</div>
</div>
	<script>
		var crumbs = '#severity';

		$(function() {

			$('.nav-tabs a').each(function(index, el) {

				var $this = $(this);
				var pane = $this.attr('href');
				var which = $this.data('src');

				if (pane == '#severity')
					$(pane).load(which);

			});

		});

		$('.nav-tabs').on('click', 'a', function(e) {
			e.preventDefault();

			var $this = $(this);
			var pane = $this.attr('href');
			var which = $this.data('src');

			if (!crumbs.includes(pane)) {
				$(pane).load(which);
				crumbs = crumbs + pane;
				console.log({
					pane : pane,
					which : which
				});
			}
		});
	</script>
</body>
</html>
