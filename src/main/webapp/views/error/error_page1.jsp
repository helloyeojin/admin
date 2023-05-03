<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<div class="container-fluid">

  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Error Page</h6>
    </div>
    <div class="card-body">
      <div id="container">
        <h1 class="h3 mb-2 text-gray-800">에러 발생</h1>
        <br>
        <h6><b>** 에러 발생 사유 **</b></h6>
        <h6>${msg}</h6>
      </div>
    </div>
  </div>
</div>