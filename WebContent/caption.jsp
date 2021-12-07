<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<sql:query var="captions" dataSource="jdbc/N3CPeds">
	select caption from n3c_peds.caption where tag = ?
	<sql:param>${param.tag}</sql:param>
 </sql:query>
<c:forEach items="${captions.rows}" var="row" varStatus="rowCounter">
	${row.caption }
</c:forEach>