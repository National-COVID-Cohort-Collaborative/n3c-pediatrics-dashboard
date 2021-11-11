<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="projects" dataSource="jdbc/N3CPeds">
select jsonb_pretty(jsonb_agg(foo)) from (
	SELECT x.date, y.child as "[1,5)", y.tween as "[5,12)", y.teen as "[12,19)" from (
		SELECT generate_series(min(date), max(date), '1 month')::date AS date FROM  n3c_peds.peds_group) x
	Left JOIN n3c_peds.peds_group y USING (date)
	ORDER BY date) as foo
</sql:query>

<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>

