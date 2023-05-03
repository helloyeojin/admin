<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let cust_detail = {
        init:function(){
            $('#update_btn').click(function(){
                cust_detail.send();
            });
            $('#delete_btn').click(function(){
                var c = confirm("삭제하시겠습니까?");
                if(c == true){
                    location.href="/cust/deleteimpl?id=${dcust.id}";
                }
            });
        },
        send: function(){
            $('#detail_form').attr({
                'action':'/cust/updateimpl',
                'method':'post'
            });
            $('#detail_form').submit();
        }
    };

    $(function(){
        cust_detail.init();
    });
</script>

    <!-- Begin Page Content -->
    <div class="container-fluid">


        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Profile</h6>
            </div>
            <div class="card-body">
                <div id="container">
                    <div class="row content">
                        <div class="col-sm-8  text-left ">
                            <h1>Profile</h1>
                            <form id="detail_form" class="form-horizontal well">
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="id">ID:</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="id" class="form-control" id="id" value="${dcust.id}" readonly>
                                    </div>
                                    <div>
                                        <span id="check_id" class="bg-danger"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="pwd">Password:</label>
                                    <div class="col-sm-10">
                                        <input type="password" name="pwd" class="form-control" id="pwd">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="name">Name:</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="name" class="form-control" id="name" value="${dcust.name}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button id="update_btn" type="button" class="btn btn-primary" style="margin-top:10px">Update</button>
                                        <button id="delete_btn" type="button" class="btn btn-primary" style="margin-top:10px">Delete</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- /.container-fluid -->
    </div>