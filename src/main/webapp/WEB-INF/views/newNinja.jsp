<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>New Ninja</title>
<t:base>
    <div class="container">
        <a href="/dashboard">dashboard</a>
        <h3 class="display-3">New Ninja</h3>
        <form:form action="/ninjas/new" method="post" modelAttribute="ninja">
            <div class="mb-3">
                <form:label for="dojo" class="form-label" path="dojo">Dojo:</form:label>
                <form:errors path="dojo" class="text-danger" />
                <form:select path="dojo">
                    <c:forEach var="dojo" items="${dojos}">
                        <form:option value="${dojo.id}">
                            ${dojo.name}
                        </form:option>
                    </c:forEach>
                </form:select>
            </div>
            <div class="mb-3">
                <form:label for="firstName" class="form-label" path="firstName">First Name:</form:label>
                <form:errors path="firstName" class="text-danger" />
                <form:input type="text" class="form-control" path="firstName"/>
            </div>
            <div class="mb-3">
                <form:label for="lastName" class="form-label" path="lastName">Last Name:</form:label>
                <form:errors path="lastName" class="text-danger" />
                <form:input type="text" class="form-control" path="lastName"/>
            </div>
            <div class="mb-3">
                <form:label for="age" class="form-label" path="age">Age:</form:label>
                <form:errors path="age" class="text-danger" />
                <form:input type="number" class="form-control" path="age"/>
            </div>
            <button type="submit" class="btn btn-primary">Create</button>
        </form:form>
    </div>
</t:base>