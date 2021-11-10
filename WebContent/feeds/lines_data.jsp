<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="projects" dataSource="jdbc/N3CPeds">
select jsonb_pretty(jsonb_agg(foo)) from (select date,month_year_factor,coalesce(child,0) as child,coalesce(tween,0) as tween,coalesce(teen,0) as teen from n3c_peds.peds_group order by date) as foo
</sql:query>

<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>

