<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let adminfo_form = {
        init:function(){
            $('#adminfo_btn').click(function(){
                adminfo_form.send();
            });
            $('#id').keyup(function(){
                var txt_id = $(this).val();
                if(txt_id.length <=3){
                    return;
                }
                $.ajax({
                    url:'/checkid',
                    data: {id: txt_id},   // {'id':id} 이렇게 써도 됨
                    success: function(result){
                        if(result == 0){
                            $('#check_id').text('사용 가능한 ID입니다.');
                        } else{
                            $('#check_id').text('사용 불가한 ID입니다.');

                        }
                    }
                });
            });
        },
        send: function(){
            var id = $('#id').val();
            var pwd = $('#pwd').val();
            var lev = $('#lev').val();
            if(id.length <= 3){
                $('#check_id').text('4자리 이상이어야 합니다.');
                $('#id').focus();
                return;
            }
            if(pwd==''){
                return;
                $('#pwd').focus();
                return;
            }
            if(lev==''){
                $('#lev').focus();
                return;
            }

            $('#adminfo_form').attr({
                'action':'/adminfoimpl',
                'method':'post'
            });
            $('#adminfo_form').submit();
        }
    };

    $(function(){
        adminfo_form.init();
    });
</script>

    <!-- Begin Page Content -->
    <div class="container-fluid">


        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">ADMIN INFO</h6>
            </div>
            <div class="card-body">
                <div id="container">
                    <div class="row content">
                        <div class="col-sm-8  text-left ">
                            <h1>Profile</h1>
                            <form id="adminfo_form" class="form-horizontal well">
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="id">ID:</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="id" class="form-control" id="id" value="${adminfo.id}" readonly>
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
                                    <label class="control-label col-sm-4" for="name">NAME:</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="lev" class="form-control" id="name" value="${adminfo.lev}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button id="adminfo_btn" type="button" class="btn btn-default">Update</button>
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