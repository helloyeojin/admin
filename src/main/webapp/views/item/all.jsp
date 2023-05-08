<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
  let item_search = {
    init: function(){
      $('#search_btn').click(function(){
        $('#search_form').attr({
          method:'post',
          action:'/item/search'
        });
        $('#search_form').submit();
      });
    }
  };

  $(function(){
    item_search.init();
  });
</script>

<div class="container-fluid">

  <!-- Page Heading -->
  <h1 class="h3 mb-2 text-gray-800">All Items</h1>

  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Item List</h6>
<%--      <form id="search_form" class="form-inline well"  style="margin-top: 15px">--%>
<%--        <div class="form-group col-sm-14">--%>
<%--          <label class="control-label col-sm-2">Price:</label>--%>
<%--          <div class="col-sm-4">--%>
<%--            <input type="text" name="search_price1" class="form-control col-sm-12" id="search_price1" placeholder="Enter title" value="${is.search_price1}">--%>
<%--          </div>--%>
<%--          <div><span>~</span></div>--%>
<%--          <div class="col-sm-4">--%>
<%--            <input type="text" name="search_price2" class="form-control col-sm-12" id="search_price2" placeholder="Enter title" value="${is.search_price2}">--%>
<%--          </div>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--          <div class="col-sm-offset-2 col-sm-2">--%>
<%--            <button id="search_btn" type="button" class="btn btn-primary">Search</button>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </form>--%>
      <form id="search_form" action="/item/search" method="get" class="form-inline well">

        <div class="form-group col-sm-4">
          <label class="control-label col-sm-2" for="name">Name:</label>
          <div class="col-sm-4">
            <input type="text" name="name" class="form-control" id="name" placeholder="Enter title"
                   value="${ms.name}"
            >
          </div>
        </div>
        <div class="form-group col-sm-4">
          <label class="control-label col-sm-2" for="price">Price:</label>
          <div class="col-sm-4">
            <input type="number" name="price" class="form-control" id="price" placeholder="Enter title"
                   value="${ms.price}"
            >
          </div>
        </div>
        <div class="form-group col-sm-10">
          <label class="control-label col-sm-2" for="startdate">Start Date:</label>
          <div class="col-sm-4">
            <input type="date" name="startdate" class="form-control" id="startdate" placeholder="Enter title"
                   value="${ms.startdate}"
            >
          </div>
          <label class="control-label col-sm-2" for="enddate">End Date:</label>
          <div class="col-sm-4">
            <input type="date" name="enddate" class="form-control" id="enddate" placeholder="Enter title"
                   value="${ms.enddate}"
            >
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-2">
            <button id="search_btn" type="submit" class="btn btn-info">Search</button>
<%--            폼을 바로 전송할 때는 submit으로 타입 변경--%>
          </div>
        </div>
      </form>
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
                    <a href="detail?id=${obj.id}" class="btn btn-primary" role="button">상품 상세조회</a>
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

