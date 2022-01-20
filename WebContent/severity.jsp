
<div class="row large-mb">
	<div class="col-xs-12 centered">
		<h3>COVID-19 Disease Severity over Time</h3>
		<jsp:include page="release_date.jsp"/>
		<p>Click on an image to zoom.</p>
	</div>
	<div class="col-xs-12, col-md-6">
		<h4 class="centered">Pediatrics</h4>
		<a href="downloads/peds_all_severity.svg"><img alt="test image"
			src="downloads/peds_all_severity.svg" width="100%"></a>
	</div>
	<div class="col-xs-12, col-md-6">
		<h4 class="centered">Adult</h4>
		<a href="downloads/adult_all_severity.svg"><img alt="test image"
			src="downloads/adult_all_severity.svg" width="100%"></a>
	</div>
	<div class="col-xs-12 centered">
		<h3>Plotly</h3>
	</div>
	<div class="col-xs-12, col-md-6">
		<h4 class="centered">Pediatrics</h4>
		<jsp:include page="plotly/peds_all_severity.html"/>
	</div>
	<div class="col-xs-12, col-md-6">
		<h4 class="centered">Adult</h4>
		<jsp:include page="plotly/adult_all_severity.html"/>
	</div>
	<div class="col-xs-3">&nbsp;</div>
	<div class="col-xs-6">
		<jsp:include page="caption.jsp">
			<jsp:param value="severity" name="tag"/>
		</jsp:include>
	</div>
	<div class="col-xs-12 centered">
	<div class="col-xs-2">&nbsp;</div>
	<div class="col-xs-8">
		<h4>Vasoactive and Mechanical Ventilation</h4>
		<a href="downloads/peds_whysevere.svg"><img alt="test image"
			src="downloads/peds_whysevere.svg" width="100%"></a>
	</div>
	<div class="col-xs-3">&nbsp;</div>
	<div class="col-xs-6">
		<jsp:include page="caption.jsp">
			<jsp:param value="severity_reason" name="tag"/>
		</jsp:include>
	</div>
	</div>
</div>
