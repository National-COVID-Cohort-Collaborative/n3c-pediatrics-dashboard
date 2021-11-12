<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="projects" dataSource="jdbc/N3CPeds">
	SELECT jsonb_pretty(jsonb_agg(foo))
	FROM (select * from n3c_peds.peds_group) AS foo;
</sql:query>
{
    "headers": [
        {"value":"date", "label":"Datestamp"},
        {"value":"month_year_factor", "label":"Date"},
        {"value":"child", "label":"[1,5)"},
        {"value":"tween", "label":"[5,12)"},
        {"value":"teen", "label":"[12,19)"}
    ],
    "rows" : 
<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
