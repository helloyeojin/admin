<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let item_detail = {
        init:function(){
            $('#update_btn').click(function(){
                item_detail.send();
            });
            $('#delete_btn').click(function(){
                var c = confirm("삭제하시겠습니까?");
                if(c == true){
                    location.href="/item/deleteimpl?id=${ditem.id}";
                }
            });
        },
        send: function(){
            $('#detail_form').attr({
                'action':'/item/updateimpl',
                'method':'post',
                enctype: 'multipart/form-data'
            });
            $('#detail_form').submit();
        }
    };

    $(function(){
        item_detail.init();
    });
</script>

    <!-- Begin Page Content -->
    <div class="container-fluid">


        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">${ditem.id}</h6>
            </div>
            <div class="card-body">
                <div id="container">
                    <div class="row content">
                        <div class="col-sm-8  text-left ">
                            <h1>Item Information</h1>
                            <form id="detail_form" class="form-horizontal well">
                                <input type="hidden" name="id" value="${ditem.id}">
<%--                                폼 태그 안에 있는 정보만 날아가기 때문에 id를 위쪽에서 출력하긴 했지만 정보를 보내기 위해 폼 안에 히든 속성으로 하나 더 써주는 것--%>
                                <input type="hidden" name="imgname" value="${ditem.imgname}">
<%--                                이것도 만약에 밑에서 이미지를 추가하지 않고 업데이트를 치면 이미지가 삭제되어 버리기 때문에 히든 속성으로 하나 더 써주는거!--%>
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <img src="/uimg/${ditem.imgname}" style="width: 500px; height: 500px; margin: 20px 0">
                                    </div>
                                    <label class="control-label col-sm-4" for="id">ID:</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="id" class="form-control" id="id" value="${ditem.id}" readonly>
                                    </div>
                                    <div>
                                        <span id="check_id" class="bg-danger"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="name">Name:</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="name" class="form-control" id="name" value="${ditem.name}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="price">Price:</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="price" class="form-control" id="price" value="${ditem.price}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="img">Image:</label>
                                    <div class="col-sm-10">
                                        <input type="file" name="img" class="form-control" id="img" placeholder="Input image">
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