<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<title>Show Expense</title>
<t:base>
    <div class="container">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <div>
                    <h3 class="display-3">Expense Details</h3>
                </div>
                <div>
                    <a href="/expenses">Go back</a>
                </div>

            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-3">Expense Name:</div>
                    <div class="col-3">${expense.name}</div>
                </div>
                <div class="row">
                    <div class="col-3">Expense Description:</div>
                    <div class="col-3">${expense.description}</div>
                </div>
                <div class="row">
                    <div class="col-3">Vendor:</div>
                    <div class="col-3">${expense.vendor}</div>
                </div>
                <div class="row">
                    <div class="col-3">Amount Spent:</div>
                    <div class="col-3"><fmt:formatNumber type="CURRENCY" currencySymbol="$" maxFractionDigits="2"
                                                         minFractionDigits="2" value="${expense.amount}"/></div>
                </div>

            </div>

        </div>
    </div>
</t:base>