<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="container-fluid">

  <!-- Page Heading -->
  <h1 class="h3 mb-2 text-gray-800">All Customers</h1>

  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Customer List</h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
          <tr>
            <th>ID</th>
            <th>NAME</th>
          </tr>
          </thead>
          <tfoot>
          <tr>
            <th>ID</th>
            <th>NAME</th>
          </tr>
          </tfoot>
          <tbody>
          <c:forEach var="obj" items="${clist}">
            <tr>
              <td><a href="/cust/detail?id=${obj.id}">${obj.id}</a></td>
              <td>${obj.name}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>

</div>
<!-- /.container-fluid -->
