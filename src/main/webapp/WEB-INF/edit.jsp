<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Edit My Task</title>
<t:base>
    <div class="container-fluid d-flex flex-column align-items-center justify-content-center p-5">
        <h4 class="display-4">Edit expense</h4>
        <form:form action="/expenses/edit/${expense.id}" method="post" modelAttribute="expense">
            <input type="hidden" name="_method" value="put">
            <div class="mb-3">
                <form:label for="name" class="form-label" path="name">Expense:</form:label>
                <form:errors path="name" class="text-danger" />
                <form:input type="text" class="form-control" path="name" value="${expense.name}"/>
            </div>
            <div class="mb-3">
                <form:label for="vendor" class="form-label" path="vendor">Vendor:</form:label>
                <form:errors path="vendor" class="text-danger" />
                <form:input type="text" class="form-control" path="vendor" value="${expense.vendor}"/>
            </div>
            <div class="mb-3">
                <form:label for="amount" class="form-label" path="amount">Amount:</form:label>
                <form:errors path="amount" class="text-danger" />
                <form:input type="text" class="form-control" path="amount" value="${expense.amount}"/>
            </div>
            <div class="mb-3">
                <form:label for="description" class="form-label" path="description">Description:</form:label>
                <form:errors path="description" class="text-danger" />
                <form:input type="text" class="form-control" path="description" value="${expense.description}"/>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form:form>
        <a class="lead" href="/expenses">go back</a>
    </div>
</t:base>
