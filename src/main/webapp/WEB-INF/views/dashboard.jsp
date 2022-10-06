<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Dojos</title>
<t:base>
    <div class="container mt-5">
        <a href="/ninjas/new">Add Ninja</a>
        <a href="/dojos/new">Add Dojo</a>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Name</th>
                <th>Ninjas</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="dojo" items="${dojos}">
                <tr>
                    <td><a href="/dojos/${dojo.id}">${dojo.name}</a></td>
                    <td>${dojo.ninjas.size()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</t:base>