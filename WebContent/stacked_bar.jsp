<!DOCTYPE html>
<meta charset="utf-8">
<style>
.bar_tool{
	width:60px;
}

</style>
<body>

	
<script src="https://d3js.org/d3.v4.min.js"></script>
<script>


	//set the dimensions and margins of the graph
	var stacked_margin = {top: 30, right: 100, bottom: 40, left: 80},
		stacked_width = 960 - stacked_margin.left - stacked_margin.right,
		stacked_height = 600 - stacked_margin.top - stacked_margin.bottom;
		

	d3.json("feeds/stacked_bar_data.jsp", function(error, data) {	
		if (error) throw error;
		
		var mystackedObserver = new ResizeObserver(entries => {
			entries.forEach(entry => {
				var newWidth = Math.floor(entry.contentRect.width);
				if (newWidth > 0) {
					d3.select("${param.dom_element}").select("svg").remove();
					stacked_width = newWidth - stacked_margin.left - stacked_margin.right;
					stacked_height = (stacked_width/1.5) - stacked_margin.top - stacked_margin.bottom;
					draw_stacks()
				}
			});
		});
		
		mystackedObserver.observe(d3.select("${param.dom_element}").node());

		draw_stacks()
			
		function draw_stacks() {
			
		    var stacked_svg =  d3.select("${param.dom_element}").append("svg").attr("width", stacked_width + stacked_margin.left + stacked_margin.right)
				.attr("width", stacked_width + stacked_margin.left + stacked_margin.right)
				.attr("height", stacked_height + stacked_margin.top + stacked_margin.bottom)
				.append("g")
				.attr("transform", "translate(" + stacked_margin.left + "," + stacked_margin.top + ")");
			
			// set x scale
			var x = d3.scaleBand()
			    .rangeRound([0, stacked_width])
			    .paddingInner(0.05)
			    .align(0.1);
			
			// set y scale
			var y = d3.scaleLinear()
			    .rangeRound([stacked_height, 0]);

			// set the colors
			var z = d3.scaleOrdinal()
			    .range(["#bce4d7", "#66b3c2", "#357fa2"]);
						
 			//Categories
			var keys = [];
			for (key in data[0]){
 		    	if (key != "date" && key != "month_year_factor" && key != "total")
 		      		keys.push(key);
 		  	}
 		  	data.forEach(function(d){
 		    	d.total = 0;
 		    	keys.forEach(function(k){
 		      		d.total += d[k];
 		    	})
 		  	});
			
			data.sort(function(a, b) { return b.date - a.date; });
  			x.domain(data.map(function(d) { return d.date; }));
  			y.domain([0, d3.max(data, function(d) { return d.total; })]).nice();
  			z.domain(keys);
  			
  			stacked_svg.append("g")
  		   		.selectAll("g")
  		    	.data(d3.stack().keys(keys)(data))
  		    	.enter().append("g")
  		      		.attr("fill", function(d) { return z(d.key); })
  		    	.selectAll("rect")
  		    	.data(function(d) { return d; })
  		    	.enter().append("rect")
  		      		.attr("x", function(d) { return x(d.data.date); })
  		      		.attr("y", function(d) { return y(d[1]);})
  		      		.attr("height", function(d) { return y(d[0]) - y(d[1]); })
  		      		.attr("width", x.bandwidth())
  		      	.on("mouseenter", function() { stacked_tool.style("display", null); })
		    	.on("mouseleave", function() { stacked_tool.style("display", "none"); })
		    	.on("mousemove", stacked_mousemove);
  			
  			stacked_svg.append("g")
				.attr("class", "axis")
				.attr("transform", "translate(0," + stacked_height + ")")
				.call(d3.axisBottom(x).tickFormat(function(date){
					update = new Date(date.replace(/-/g, '\/').replace(/T.+/, ''));
					month = update.getMonth();
					if (month == 0) {
						return d3.timeFormat('%Y')(update);
					} else {
						return d3.timeFormat('%b')(update);
					}
				}))
				.selectAll("text")  
    				.style("text-anchor", "end")
    				.attr("dx", "-.8em")
    				.attr("dy", ".15em")
    				.attr("transform", "rotate(-65)");
  			
  			stacked_svg.append("g")
				.attr("class", "axis")
				.call(d3.axisLeft(y).ticks(null, "s"))
				.append("text")
				.attr("x", 2)
				.attr("y", y(y.ticks().pop()) + 0.5)
				.attr("dy", "0.32em")
				.attr("fill", "#000")
				.attr("font-weight", "bold")
				.attr("text-anchor", "start");

			var legend = stacked_svg.append("g")
				.attr("font-family", "sans-serif")
				.attr("font-size", 10)
				.attr("text-anchor", "end")
				.selectAll("g")
				.data(keys.slice().reverse())
				.enter().append("g")
					.attr("transform", function(d, i) { return "translate(70," + ((i * 20)+8) + ")"; });

			legend.append("rect")
 				.attr("x", stacked_width - 19)
				.attr("width", 19)
				.attr("height", 19)
				.attr("fill", z);

			legend.append("text")
				.attr("x", stacked_width - 24)
				.attr("y", 9.5)
				.attr("dy", "0.32em")
				.text(function(d) { return d; });
			
			var legendname = stacked_svg.append("g")
				.attr("font-family", "sans-serif")
				.attr("font-size", 10)
				.attr("font-weight", "bold")
				.attr("text-anchor", "left")
				.append("text")
					.attr("x", stacked_width )
					.attr("y", 0)
					.attr("dy", "0.32em")
					.text("Age Groups");
			
			var stacked_tool = stacked_svg.append("g")
	    		.attr("class", "stacked_focus")
	    		.style("display", "none");
			
			stacked_tool.append("rect")
	    		.attr("class", "bar_tool")
	    		.attr("width", 10)
    			.attr("height", 20)
    			.attr("fill", "white")
    			.style("opacity", 0.6)
    			.style("pointer-events", "none");
	
			stacked_tool.append("text")
				.attr("x", 30)
    			.attr("dy", "1.2em")
    			.style("text-anchor", "middle")
    			.attr("font-size", "12px")
    			.attr("font-weight", "bold");
				
			
			function stacked_mousemove(d) {
				var xPosition = d3.mouse(this)[0] - 5;
			    var yPosition = d3.mouse(this)[1] - 5;
			    stacked_tool.attr("transform", "translate(" + xPosition + "," + yPosition + ")");
			    stacked_tool.select("text").text(d[1]-d[0]);
			}
		};
		
		
	});

</script>
</body>