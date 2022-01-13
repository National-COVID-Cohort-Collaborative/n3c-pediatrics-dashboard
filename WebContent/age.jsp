
<div class="row large-mb">
	<div class="col-xs-12 centered">
		<h3>COVID-19 Age Distributions over Time - All Patients</h3>
		<jsp:include page="release_date.jsp"/>
		<p>Click on an image to zoom.</p>
	</div>
	<div class="col-xs-12, col-md-6">
		<h4 class="centered">Pediatrics</h4>
		<a href="downloads/peds_all_pcrag.svg"><img alt="test image" src="downloads/peds_all_pcrag.svg" width="100%"></a>
	</div>
	<div class="col-xs-12, col-md-6">
		<h4 class="centered">Adult</h4>
		<a href="downloads/adult_all_pcrag.svg"><img alt="test image" src="downloads/adult_all_pcrag.svg" width="100%"></a>
	</div>
	<div class="col-xs-3">&nbsp;</div>
	<div class="col-xs-6">
		<jsp:include page="caption.jsp">
			<jsp:param value="age_all" name="tag" />
		</jsp:include>
		<p></p>
	</div>
	<div class="col-xs-3">&nbsp;</div>
</div>
<div class="row large-mb">
	<div class="col-xs-12 centered">
		<h3>COVID-19 Age Distributions over Time - Hospitalized Patients</h3>
		<p>Click on an image to zoom.</p>
	</div>
	<div class="col-xs-12, col-md-6">
		<h4 class="centered">Pediatrics</h4>
		<a href="downloads/peds_hosp_pcragab.svg"><img alt="test image" src="downloads/peds_hosp_pcragab.svg" width="100%"></a>
	</div>
	<div class="col-xs-12, col-md-6">
		<h4 class="centered">Adult</h4>
		<a href="downloads/adult_hosp_pcrag.svg"><img alt="test image" src="downloads/adult_hosp_pcrag.svg" width="100%"></a>
	</div>
	<div class="col-xs-3">&nbsp;</div>
	<div class="col-xs-6">
		<jsp:include page="caption.jsp">
			<jsp:param value="age_hospitalized" name="tag" />
		</jsp:include>
	</div>
	<div class="col-xs-3">&nbsp;</div>
</div>
<div class="row large-mb">
	<div class="col-xs-3">&nbsp;</div>
	<div class="col-xs-6">
		<h4 class="centered">Pediatrics - Antibody Positive Only</h4>
		<a href="downloads/peds_hosp_ab.svg"><img alt="test image" src="downloads/peds_hosp_ab.svg" width="100%"></a>
		<jsp:include page="caption.jsp">
			<jsp:param value="age_antibody" name="tag" />
		</jsp:include>
	</div>
</div>

