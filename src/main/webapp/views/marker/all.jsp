<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
  let marker_search = {
    init: function(){
      $('#search_btn').click(function(){
        $('#search_form').attr({
          method:'post',
          action:'/marker/search'
        });
        $('#search_form').submit();
      });
    }
  };

  $(function(){
    marker_search.init();
  });
</script>

<div class="container-fluid">

  <!-- Page Heading -->
  <h1 class="h3 mb-2 text-gray-800">All Markers</h1>

  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Marker List</h6>
      <form id="search_form" class="form-inline well"  style="margin-top: 15px">
        <div class="form-group">
          <label class="control-label col-sm-4" for="loc">Location:</label>
            <div class="col-sm-6">
              <select class="form-control" id="loc" name="loc">
                <option value="">전체</option>
                <option value="s"   <c:if test="${ms.loc=='s'}">selected</c:if> >서울</option>
                <option value="b"   <c:if test="${ms.loc=='b'}">selected</c:if>>부산</option>
                <option value="j"   <c:if test="${ms.loc=='j'}">selected</c:if>>제주</option>
              </select>
            </div>
          </div>
          <div class="form-group">
          <label class="control-label col-sm-2" for="title">Title:</label>
          <div class="col-sm-6">
            <input type="text" name="title" class="form-control" id="title" placeholder="Enter title" value="${ms.title}">
          </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-2">
              <button id="search_btn" type="button" class="btn btn-primary">Search</button>
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
            <th>TITLE</th>
            <th>LOCATION</th>
          </tr>
          </thead>
          <tfoot>
          <tr>
            <th>IMG</th>
            <th>ID</th>
            <th>TITLE</th>
            <th>LOCATION</th>
          </tr>
          </tfoot>
          <tbody>
          <c:forEach var="obj" items="${mlist}">
            <tr>
              <td><a href="#" data-toggle="modal" data-target="#target${obj.id}">
                <img id="item_img" src="/uimg/${obj.img}" alt="${obj.img}" style="width:100px; height:100px"/>
              </a></td>
              <td><a href="/marker/detail?id=${obj.id}">${obj.id}</a></td>
              <td>${obj.title}</td>
              <td>
                <c:choose>
                  <c:when test="${obj.loc=='S'}">서울</c:when>
                  <c:when test="${obj.loc=='B'}">부산</c:when>
                  <c:when test="${obj.loc=='J'}">제주</c:when>
                </c:choose>
              </td>
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
                    <p>${obj.title}</p>
                    <img src="/uimg/${obj.img}" alt="${obj.img}" style="width:465px; height:465px"/>
                  </div>
                  <div class="modal-footer">
                    <a href="detail?id=${obj.id}" class="btn btn-primary" role="button">상세조회</a>
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

