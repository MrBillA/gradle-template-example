<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="e" tagdir="/WEB-INF/tags" %>
<!doctype html>
<html>
<head>
    <title><spring:message code="page.users.index.title"/></title>
    <e:resource url="css/datatables/datatables" type="css" minify="false"/>
    <content tag="defer">
        <e:resource url="js/datatables/jquery.dataTables.min" type="js" minify="false"/>
        <e:resource url="js/datatables/jquery.dataTables.bootstrap.min" type="js" minify="false"/>
    </content>
</head>
<body>
<div>
    <form:form action="${pageContext.request.contextPath}/users/delete" method="delete">
        <div class="row-fluid entity-actions">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/users/create">
                <i class="icon-plus"></i>
                <spring:message code="buttons.new"/>
            </a>
            <a href="#" class="btn primary" id="delete-selected">
                <i class="icon-trash"></i>
                <spring:message code='buttons.delete.selected'/>
            </a>
        </div>

        <div class="row-fluid">
            <table class="table table-bordered table-condensed table-striped datatable"
                   data-source-url="${pageContext.request.contextPath}/users/list"
                   data-delete-row-url="${pageContext.request.contextPath}/users/delete"
                   data-edit-row-url="${pageContext.request.contextPath}/users/edit">
                <thead>
                <tr>
                    <th class="datatable-select"></th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th class="datatable-actions"></th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </form:form>
</div>
</body>
</html>