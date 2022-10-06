<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>New Dojo</title>
<t:base>
    <div class="container">
        <a href="/dashboard">dashboard</a>
        <h3 class="display-3">New Dojo</h3>
        <form:form action="/dojos/new" method="post" modelAttribute="dojo">
            <div class="mb-3">
                <form:label for="name" class="form-label" path="name">Name:</form:label>
                <form:errors path="name" class="text-danger" />
                <form:input type="text" class="form-control" path="name"/>
            </div>
            <button type="submit" class="btn btn-primary">Create</button>
        </form:form>
    </div>
</t:base>