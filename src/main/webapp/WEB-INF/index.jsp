<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Travels</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

    <div class="container">
        <div class="main">
            <div>
                <h1 class="text-center">Safe Travels</h1>
            </div>
                <table class="table table-sm table-striped-columns mb-5 mt-3 table-bordered border-dark text-center">
                    <thead>
                    <tr>
                        <th scope="col">Expense</th>
                        <th scope="col">Vendor</th>
                        <th scope="col">Amount</th>
                        <th scope="col">Actions</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="expense" items="${expenses}">
                        <tr>
                            <td><a href="/expenses/${expense.id}">${expense.name}</a></td>
                            <td>${expense.vendor}</td>
                            <td><fmt:formatNumber type="CURRENCY" currencySymbol="$" maxFractionDigits="2" minFractionDigits="2" value="${expense.amount}"/></td>
                            <td><a href="/expenses/edit/${expense.id}">edit</a></td>
                            <td>
                                <form action="/expenses/${expense.id}" method="post">
                                    <input type="hidden" name="_method" value="delete">
                                    <input class="btn btn-danger" type="submit" value="Delete">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            <h1>Add an expense:</h1>
            <form class="form-control" action="/expenses/add" method = "POST" modelAttribute="expense">
                <div class="mb-3">
                    <label for="name" class="form-label">Name: </label>
                    <input type="text" class="form-control" id="name" aria-describedby="name" name="name">
                </div>
                <div class="mb-3">
                    <label for="vendor" class="form-label">Vendor</label>
                    <input type="text" class="form-control" id="vendor" name="vendor">
                </div>
                <div class="mb-3">
                    <label for="amount" class="form-label">Amount</label>
                    <input type="number" class="form-control" id="amount" name="amount">
                </div>
                <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description"></textarea>
                 </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>

        </div>

    </div>
</body>
</html>

