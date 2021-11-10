<!DOCTYPE html>
<meta charset="utf-8">
<style>
    .axis path,
    .axis line {
        fill: none;
        stroke: #000;
        shape-rendering: crispEdges;
    }

    .x.axis path {
        display: none;
    }

    .line {
        fill: none;
        stroke-width: 1.5px;
    }

    .overlay {
        fill: none;
        pointer-events: all;
    }
	
	.tooltip-tween,
	text.tween{
        fill: #2d5985;
    }
    
    .tween_child_focus .tooltip{
    	fill: white;
    	opacity: 0.7;
    	stroke:none;
    	width:90px;
    }
    
    path.teen{
    	stroke: #377eb8;
    	stroke-width:2.8px;
    }
    path.tween{
    	stroke: #2d5985;
    	stroke-width:2.8px;
    }
    path.child{
    	stroke:#6b496b;
    	stroke-width:2.8px;
    }
    
    
    .tooltip-child, 
    text.child{
    	fill:#6b496b;
    }
    
    .tween_child_focus text{
        font-size: 12px;
    }

    .tooltip-teen, 
    text.child{
    	fill:#6b496b;
    }
    
    .tween_teen_focus text{
        font-size: 12px;
    }

    .tooltip {
        fill: white;
        stroke: #000;
    }

    .tooltip-date_child_tween, 
    .tooltip-teen, 
    .tooltip-tween, 
    .tooltip-child{
        font-weight: bold;
    }

</style>
<body>
	

<script>

// set the dimensions and margins of the graph
	var margin = {top: 30, right: 100, bottom: 60, left: 50},
	    width = 960 - margin.left - margin.right,
	    height = 600 - margin.top - margin.bottom;
	
	d3.json("${param.data_page}", function(error, data) {	
		if (error) throw error;
		
		var myObserver = new ResizeObserver(entries => {
			entries.forEach(entry => {
				var newWidth = Math.floor(entry.contentRect.width);
				if (newWidth > 0) {
					d3.select("${param.dom_element}").select("svg").remove();
					width = newWidth - margin.left - margin.right;
					height = width/2 - margin.top - margin.bottom;
					draw_child_tween();
				}
			});
		});
		
		myObserver.observe(d3.select("${param.dom_element}").node());

		draw_child_tween();
		
		function draw_child_tween() {
	
			// set the ranges
			var x = d3.scaleTime().range([0, width]);
			var y = d3.scaleLinear().range([height, 0]);
			var line = d3.line().x(d => x(d.date)).y(d => y(d.teen));
		
			// append the svg obgect to the body of the page
			// appends a 'group' element to 'svg'
			// moves the 'group' element to the top left margin
			var tween_child_svg = d3.select("#age_line").append("svg")
				.attr("width", width + margin.left + margin.right)
				.attr("height", height + margin.top + margin.bottom)
				.append("g")
				.attr("transform", "translate(" + margin.left + "," + margin.top + ")");
			
			
				// Dates
			 	data.forEach(function(d) {
					d.date = new Date(d.date);
				});
			
				// Scales
				x.domain(d3.extent(data, function(d) { return d.date; }));
				y.domain([0, d3.max(data, function(d) { return d.teen; })]);
			  
				// X & Y 
				var valueline = d3.line()
					.x(function(d) { return x(d.date); })
					.y(function(d) { return y(d.tween); });
				var valueline2 = d3.line()
					.x(function(d) { return x(d.date); })
					.y(function(d) { return y(d.child); });
				var valueline3 = d3.line()
				.x(function(d) { return x(d.date); })
				.y(function(d) { return y(d.teen); });
			
				// Lines
				tween_child_svg.append("path")
					.data([data])
					.attr("class", "line tween")
					.attr("d", valueline);
				tween_child_svg.append("path")
					.data([data])
					.attr("class", "line child")
					.attr("d", valueline2);
				tween_child_svg.append("path")
				.data([data])
				.attr("class", "line teen")
				.attr("d", valueline3);
				
			
				// Labels & Current Totals
				tween_child_svg.append("text")
		    	.attr("transform", "translate("+(width+3)+","+y(data[data.length-1].teen)+")")
		    	.attr("dy", ".35em")
		    	.attr("text-anchor", "start")
		    	.attr("class", "teen")
		    	.text("[12,19)");
				tween_child_svg.append("text")
			    	.attr("transform", "translate("+(width+3)+","+y(data[data.length-1].tween)+")")
			    	.attr("dy", ".35em")
			    	.attr("text-anchor", "start")
			    	.attr("class", "tween")
			    	.text("[5,12)");
				tween_child_svg.append("text")
			    	.attr("transform", "translate("+(width+3)+","+y(data[data.length-1].child)+")")
			    	.attr("dy", ".35em")
			    	.attr("text-anchor", "start")
			    	.attr("class", "child")
			    	.text("[1,5)");
			
				//.tickFormat(d3.time.format("%H")))
			  	// Axis
				tween_child_svg.append("g")
					.attr("transform", "translate(0," + height + ")")
					.call(d3.axisBottom(x).tickFormat(function(date){
					       if (d3.timeYear(date) < date) {
					           return d3.timeFormat('%b')(date);
					         } else {
					           return d3.timeFormat('%Y')(date);
					         }
					      }))
					.selectAll("text")  
    					.style("text-anchor", "end")
    					.attr("dx", "-.8em")
    					.attr("dy", ".15em")
    					.attr("transform", "rotate(-65)");
				tween_child_svg.append("g")
					.call(d3.axisLeft(y).ticks(5));

				//tooltip line
				var tooltipLine = tween_child_svg.append('line');
				
				// tooltips
				var tween_child_focus = tween_child_svg.append("g")
			    	.attr("class", "tween_child_focus")
			    	.style("display", "none");
			
				tween_child_focus.append("rect")
			    	.attr("class", "tooltip")
			    	.attr("height", 70)
			    	.attr("x", 10)
			    	.attr("y", -22)
			    	.attr("rx", 4)
			    	.attr("ry", 4);
			
				tween_child_focus.append("text")
			    	.attr("class", "tooltip-date_child_tween")
			    	.attr("x", 18)
			    	.attr("y", -2);
			
				tween_child_focus.append("text")
			    	.attr("x", 18)
			    	.attr("y", 30)
			    	.text("[5,12):");
				
				tween_child_focus.append("text")
		    		.attr("x", 18)
		    		.attr("y", 42)
		    		.text("[1,5):");
			
				tween_child_focus.append("text")
	    		.attr("x", 18)
	    		.attr("y", 18)
	    		.text("[12,19):");
		
				tween_child_focus.append("text")
				.attr("class", "tooltip-teen")
				.attr("x", 60)
				.attr("y", 18);
			
				tween_child_focus.append("text")
			    	.attr("class", "tooltip-tween")
			    	.attr("x", 60)
			    	.attr("y", 30);
				
				tween_child_focus.append("text")
					.attr("class", "tooltip-child")
					.attr("x", 60)
					.attr("y", 42);
				
			
				var tipBox = tween_child_svg.append("rect")
			    	.attr("class", "overlay")
			    	.attr("width", width)
			    	.attr("height", height)
			    	.on("mouseover", function() { tween_child_focus.style("display", null);  tooltipLine.style("display", null);})
			    	.on("mouseout", function() { tween_child_focus.style("display", "none");  tooltipLine.style("display", "none");})
			    	.on("mousemove", tween_child_mousemove);
			    
				var parseDate = d3.timeFormat("%m/%e/%Y").parse,
				bisectDate_tween_child = d3.bisector(function(d) { return d.date; }).left,
				formatValue = d3.format(","),
				dateFormatter = d3.timeFormat("%m/%d/%y");
			
				function tween_child_mousemove() {
				    var x0 = x.invert(d3.mouse(this)[0]),
				        i = bisectDate_tween_child(data, x0, 1),
				        d0 = data[i - 1],
				        d1 = data[i],
				        d = x0 - d0.date > d1.date - x0 ? d1 : d0;
				    //tween_focus.attr("transform", "translate(" + x(d.date) + "," + y(d.tween) + ")");
				    tween_child_focus.attr("transform", "translate(" + x(d.date) + "," + d3.mouse(this)[1] + ")");
				    tween_child_focus.select(".tooltip-date_child_tween").text(d.month_year_factor);
				    tween_child_focus.select(".tooltip-teen").text(tipentry(d.teen));
				    tween_child_focus.select(".tooltip-tween").text(tipentry(d.tween));
				    tween_child_focus.select(".tooltip-child").text(tipentry(d.child));
				    
				    tooltipLine.attr('stroke', 'black')
				    	.attr("transform", "translate(" + x(d.date) + "," + 0 + ")")
				    	.attr('y1', 0)
				    	.attr('y2', height);
				}
			};
		});

		function tipentry(d) {
			formatValue = d3.format(",");
			if (d == 0)
				return "<20";
			else
			  return formatValue(d);	
		}


</script>
</body>