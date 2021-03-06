<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" ng-app="App">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${pageContext.request.userPrincipal.name}</title>
        <jsp:include page="../jsp/components/linksHeader.jsp"/>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.8/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0rc1/angular-route.min.js"></script>

        <style>
            #trash:hover {
                color: red;
                cursor: pointer;
            }

            #trip:hover {
                color: green;
                cursor: pointer;
            }
        </style>
    </head>
    <body ng-controller="MainCtrl">

        <div class="hero-wrap js-fullheight" style="background-image: url('https://cdn2.vectorstock.com/i/1000x1000/04/61/nice-background-vector-16200461.jpg'); min-height: 100vh;">

            <jsp:include page="components/navbar.jsp" />

            <div class="overlay"></div>

            <div class="container pt-5 animated fadeInUpBig">
                <div class="container bootstrap snippet bg-white">
                    <div class="row">
                        <div class="col-sm-3 shadow-lg" style="background-color: #d4e1ee;"><!--left col-->

                            <div class="text-center">
                                <h1>${pageContext.request.userPrincipal.name}</h1>
                                <spring:form modelAttribute="file" action="" id="singleUploadForm" name="singleUploadForm" enctype="multipart/form-data">
                                    <c:if test="${empty img}">
                                        <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar" id="blah" style="height: 202px; width: 202px;">
                                        <h6>Upload photo profile</h6>
                                    </c:if>
                                    <c:if test="${not empty img}">
                                        <div style="height: 202px; width: 202px;">
                                            <img src="data:image/jpg;base64,${img}" class="avatar img-circle img-thumbnail ml-5" alt="avatar" id="blah" style="height: 202px; width: 202px;">
                                        </div>
                                        <!--<a href="${pageContext.request.contextPath}/deleteFile/${file.id}" class="btn btn-danger btn-sm mt-3 mb-4"><i class="far fa-trash-alt"></i> Delete Photo </a><br>-->
                                    </c:if>
                                    <label class="btn btn-warning btn-sm mt-3"><i class="fas fa-folder-plus"></i> Choose File 
                                        <input id="singleFileUploadInput" type="file" name="file"   class="text-center center-block file-upload file-input" style="display: none;">
                                    </label>
                                    <button type="submit" class="btn btn-success btn-sm mt-3"><i class="fas fa-check-circle"></i> Submit </button>

                                </spring:form>
                            </div></hr><br>
                            <div class="upload-response">
                                <div id="singleFileUploadError"></div>
                                <div id="singleFileUploadSuccess"></div>
                            </div>

                            <div class="panel panel-default shadow-lg">
                                <div class="panel-heading">Website <i class="fa fa-link fa-1x"></i></div>
                                <div class="panel-body"><a href="#">bootnipets.com</a></div>
                            </div>

                            <ul class="list-group shadow-lg">
                                <li class="list-group-item text-muted" style="background-color: #f1f1f1c5;">Activity <i class="fa fa-dashboard fa-1x"></i></li>
                                <li class="list-group-item text-right"><span class="pull-left"><strong>Shares</strong></span> 125</li>
                                <li class="list-group-item text-right"><span class="pull-left"><strong>Likes</strong></span> 13</li>
                                <li class="list-group-item text-right"><span class="pull-left"><strong>Posts</strong></span> 37</li>
                                <li class="list-group-item text-right"><span class="pull-left"><strong>Followers</strong></span> 78</li>
                            </ul> 

                        </div><!--/col-3-->
                        <div class="col-sm-9">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#trips">Trips</a></li>
                                <li><a data-toggle="tab" href="#profile">Profile</a></li>
                                <!--<li><a data-toggle="tab" href="#settings">Menu 2</a></li>-->
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane active" id="trips">

                                    <table class="table table-striped table-bordered table-hover border col-12 mt-5 shadow-lg" ng-show="items.length !== 0">
                                        <thead>
                                            <tr class="bg-dark text-white">
                                                <th class="border p-3" style="display:none;">id</th>
                                                <th class="border p-3 text-center">Trip</th>
                                                <th class="border p-3 text-center">Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="item in items">

                                                <td class="border p-3" style="display:none;">
                                                    {{item.id}}
                                                </td>

                                                <td class="border p-3 text-center">
                                                    <a href="${pageContext.request.contextPath}/user/userTripsPage/{{item.id}}" id="trip" style="font-size: 20px; text-decoration: none; font-family: Abril Fatface;"><i class="fas fa-suitcase-rolling"></i>&nbsp;
                                                        {{item.location}}
                                                    </a>
                                                </td>

                                                <td class="border p-3 text-center"> 
                                                    <a id="trash">
                                                        <i ng-click="deleteItem($index, item.id)" class="far fa-trash-alt ml-4 mt-1" style="font-size: 17px;"></i>
                                                    </a>
                                                </td>

                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="row pt-5 justify-content-center">
                                        <a href="${pageContext.request.contextPath}/user/choices" class="btn btn-info btn-md">Create New Trip</a>
                                    </div>
                                    <hr>
                                    <p ng-show="items.length == 0" style="font-size: 20px; font-family: Abril Fatface;">No Trips Found</p>
                                    <br>
                                    <div class="border shadow-lg text-center pb-4">
                                        <h2 class="text-center font-weight-bold pb-5" style="font-size: 30px; font-family: Abril Fatface;"> SUPPORT CHANNEL </h2>
                                        <p class="text-center">Our expertly trained support team is ready to answer your questions and solve your problems 24/7 available up to 24 hours a day and 7 days a week via chat. Also you can communicate with other users and share experiences!</p>

                                        <a href="${pageContext.request.contextPath}/chat" class="btn btn-success col-2 mt-4"><i class="fas fa-comments"></i> Chat </a>
                                    </div>

                                </div><!--/tab-pane-->

                                <div class="tab-pane" id="profile">
                                    <hr>
                                    <form class="form" action="${pageContext.request.contextPath}/" id="registrationForm" enctype="multipart/form-data">
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label path="first_name"><h4>First name</h4></label>
                                                <input style="height: 4rem!important;" type="text" class="form-control" path="first_name" id="first_name" placeholder="Enter First name ...">
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label path="last_name"><h4>Last name</h4></label>
                                                <input style="height: 4rem!important;" type="text" class="form-control" path="last_name" id="last_name" placeholder="Enter Last name ...">
                                            </div>
                                        </div>

                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label path="phone_number"><h4>Phone</h4></label>
                                                <input style="height: 4rem!important;" type="text" class="form-control" path="phone_number" id="phone" placeholder="Enter Phone number ...">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-6">
                                                <label path="mobile"><h4>Mobile</h4></label>
                                                <input style="height: 4rem!important;" type="text" class="form-control" path="mobile" id="mobile" placeholder="Enter Mobile number ...">
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label path="email"><h4>Email</h4></label>
                                                <input style="height: 4rem!important;" type="email" class="form-control" path="email" id="email" placeholder="Enter Email...">
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label path="email"><h4>Location</h4></label>
                                                <input style="height: 4rem!important;" type="email" class="form-control" path="email" id="location" placeholder="Enter your Location...">
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label for="password"><h4>Password</h4></label>
                                                <input style="height: 4rem!important;" type="password" class="form-control" name="password" id="password" placeholder="Enter password...">
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label for="password2"><h4>Verify</h4></label>
                                                <input style="height: 4rem!important;" type="password" class="form-control" name="password2" id="password2" placeholder="Retype password...">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <br>
                                                <button class="btn btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                                                <button class="btn btn-danger" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                                            </div>
                                        </div>
                                        <%--</spring:form>--%>

                                        <!--Tips Angular-->   
                                </div><!--/tab-pane-->

<!--                                <div class="tab-pane" id="settings">

                                </div>-->

                            </div><!--/tab-pane-->
                        </div><!--/tab-content-->

                    </div><!--/col-9-->
                </div>

            </div>

        </div>

        <!--/row-->

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        <script type="text/javascript" src="../js/userProfile.js"></script>
        <script src="../js/file.js" ></script>
    </body>
</html>
