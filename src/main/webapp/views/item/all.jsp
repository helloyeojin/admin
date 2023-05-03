<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="container-fluid">

  <!-- Page Heading -->
  <h1 class="h3 mb-2 text-gray-800">All Items</h1>

  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Item List</h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
          <tr>
            <th>IMG</th>
            <th>ID</th>
            <th>NAME</th>
            <th>PRICE</th>
            <th>REGDATE</th>
          </tr>
          </thead>
          <tfoot>
          <tr>
            <th>IMG</th>
            <th>ID</th>
            <th>NAME</th>
            <th>PRICE</th>
            <th>REGDATE</th>
          </tr>
          </tfoot>
          <tbody>
          <c:forEach var="obj" items="${ilist}">
            <tr>
              <td><a href="#" data-toggle="modal" data-target="#target${obj.id}">
                <img id="item_img" src="/uimg/${obj.imgname}" alt="${obj.imgname}" style="width:100px; height:100px"/>
              </a></td>
              <td><a href="/item/detail?id=${obj.id}">${obj.id}</a></td>
              <td>${obj.name}</td>
              <td><fmt:formatNumber value="${obj.price}" type="currency" pattern="###,###원"/></td>
<%--              <td><fmt:formatNumber value="${obj.price}" type="currency" currencyCode="KRW" currencySymbol="₩"/></td>--%>
              <td><fmt:formatDate  value="${obj.rdate}" pattern="yyyy-MM-dd"/></td>
            </tr>

            <!-- Modal -->
            <div id="target${obj.id}" class="modal fade" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                  <div class="modal-header">
                    <h4 class="modal-title">Item Image</h4>
                  </div>
                  <div class="modal-body">
                    <p>${obj.name}</p>
                    <img src="/uimg/${obj.imgname}" alt="${obj.imgname}" style="width:465px; height:465px"/>
                  </div>
                  <div class="modal-footer">
                    <a href="item/detail?id=${obj.id}" class="btn btn-primary" role="button">상품 상세조회</a>
                    <a href="#" class="btn btn-outline-primary" role="button" data-dismiss="modal">Close</a>
                  </div>
                </div>

              </div>
            </div>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>

</div>
<!-- /.container-fluid -->

