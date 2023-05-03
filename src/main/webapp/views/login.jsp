<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let login_form = {
        init:function (){
            $('#login_btn').click(function (){
                login_form.send();
            });
        },
        send:function (){
            $('#login_form').attr({
                'action':'/loginimpl',
                'method':'post'
            });
            $('#login_form').submit();
        }
    };

    $(function (){
        login_form.init();
    });
</script>

    <!-- Begin Page Content -->
    <div class="container-fluid">


        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Login</h6>
            </div>
            <div class="card-body">
                <div id="container">
                    <div class="row content">
                        <div class="col-sm-8 text-left">
                            <h1>Login Page</h1>
                            <form id="login_form" class="well" style="margin-top: 30px">
                                <div class="form-group">
                                    <label for="id">ID:</label>
                                    <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id">
                                </div>
                                <div class="form-group">
                                    <label for="pwd">Password:</label>
                                    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                                </div>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="remember"> Remember me</label>
                                </div>
                                <button type="button" class="btn btn-default" id="login_btn" >Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- /.container-fluid -->
    </div>