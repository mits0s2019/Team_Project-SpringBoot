
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en" ng-app="App">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UserTrips Page</title>

        <jsp:include page="../components/linksHeader.jsp"/>
        <link rel="stylesheet" href="../../css/tripsPage.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.8/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0rc1/angular-route.min.js"></script>

    </head>

    <body ng-controller="MainCtrl">
        <jsp:include page="../components/navbar.jsp"/>

        <!-- Photo container -->
        <div class="container-fluid" id="up">
        </div>

        <!-- Main Container -->
        <div class="container border up col-11" id="main">

            <!-- Title -->
            <div class="row d-flex flex-row justify-content-around align-items-center ">

                <div class="col-5">
                    <h1 class="display-4">My trip to Dublin</h1>
                </div>

                <div class="col-5">
                </div>

                <div class="col-2">
                    <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#postModal">
                        Post <i class="fas fa-share-alt"></i>
                    </button>
                </div>

            </div>

            <!-- Table -->
            <div class="row mt-2">

                <table class="table table-striped table-bordered table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th style="width: 5%" class="text-center align-middle" scope="col">Dates</th>
                            <th scope="col" class="text-center align-middle">Content</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="date in dates">
                            <th scope="row" class="text-center align-middle"><span class="date">{{date}}</span></th>

                            <td class="align-middle">

                                <div class="row">

                                    <!-- Flights-Accomodation -->
                                    <div class="col-1 d-flex align-items-center flight-accom">
                                        <a href="#" ng-show="show(date, commonDates)" data-toggle="modal"
                                           data-target="#flightModal">
                                            <i class="fas fa-plane"></i>
                                        </a>
                                    </div>

                                    <!-- Notes -->
                                    <div class="col-7 d-flex align-items-center">

                                        <div class="col-4">

                                            <button type="button" class="btn btn-secondary btn-sm add" id="notes"
                                                    data-toggle="modal" data-target="#notesModal">
                                                Notes <i class="fas fa-plus-circle"></i>
                                            </button>

                                        </div>

                                        <div class="col-8 d-flex justify-content-center"></div>

                                    </div>

                                    <!-- Budget -->
                                    <div class="col-2 d-flex align-items-center">

                                        <div class="col-9">

                                            <button type="button" class="btn btn-secondary btn-sm add" id="budget"
                                                    data-toggle="modal" data-target="#budgetModal">
                                                Budget <i class="fas fa-plus-circle"></i>
                                            </button>
                                        </div>

                                        <div class="col-3 d-flex justify-content-center">
                                            <span class="dayBudget"></span>
                                            <span ng-show="currencyShow($index)">{{currency}} </span>
                                        </div>

                                    </div>

                                    <!-- Photos -->
                                    <div class="col-2 d-flex align-items-center">

                                        <div class="col-9">

                                            <button type="button" class="btn btn-secondary btn-sm add" id="photos"
                                                    data-toggle="modal" data-target="#photosModal">
                                                Photos <i class="fas fa-plus-circle"></i>
                                            </button>
                                        </div>

                                        <div class="col-3 d-flex justify-content-center"></div>

                                    </div>

                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>

            <div class="row mt-2">

                <div class="col-5">
                </div>

                <div class="col-3">

                </div>

                <div class="col-2">
                    Total Budget: <span id="totalBudget">{{totalBudget}}</span>
                    <select ng-model="currency">
                        <option value="&euro;">&euro;</option>
                        <option value="&dollar;">&dollar;</option>
                        <option value="&pound;">&pound;</option>
                        <option value="&yen;">&yen;</option>
                    </select>
                </div>

                <div class="col-2">
                    <p>
                        Accommodation: <a href="#" data-toggle="modal" data-target="#accomModal">
                            <i class="fas fa-bed"></i>
                        </a>
                    </p>
                </div>

            </div>

        </div>

    <modals>

        <!-- Post Modal -->
        <div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Share your trip with other travellers</label>
                            <input type="text" class="form-control" placeholder="Post Title" id="postTitle">
                        </div>
                        <div class="form-group">
                            <label>Post Body</label>
                            <textarea name="postBody" class="form-control" placeholder="Post Body"
                                      id="postBody"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                name="cancel">Cancel</button>
                        <form id="formPost">
                            <button type="button" class="btn btn-info" data-dismiss="modal" id="addPost" ng-click="addPost()">Post</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Notes Modal -->
        <div class="modal fade" id="notesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add a note</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Add title</label>
                            <input type="text" class="form-control" placeholder="Note Title" id="noteTitle">
                        </div>
                        <div class="form-group">
                            <label>Note Body</label>
                            <textarea name="noteBody" class="form-control" placeholder="Note Body"
                                      id="noteBody"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                name="cancel">Cancel</button>
                        <form id="formNote">

                            <button type="submit" class="btn btn-info submitAdd" data-dismiss="modal" id="addNote"
                                    name="post" ng-click="addNote()">Add</button>

                        </form>

                    </div>
                </div>
            </div>
        </div>

        <!-- Budget Modal -->
        <div class="modal fade" id="budgetModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add budget</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Add the budget of this day</label>
                            <input type="text" class="form-control" placeholder="Budget" id="budget">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                name="cancel">Cancel</button>
                        <form id="formBudget">
                            <button type="button" class="btn btn-info submitAdd" data-dismiss="modal" id="addBudget"
                                    name="post" ng-click="addBudget()">Add</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Photos Modal -->
        <div class="modal fade" id="photosModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Add photos of this day</label>
                            <input type="file" class="form-control" id="photos">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                name="cancel">Cancel</button>
                        <form id="formPhotos" enctype="multipart/form-data" method="POST">
                            <button type="button" class="btn btn-info submitAdd" data-dismiss="modal" id="addPhotos"
                                    name="photo">Add</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Flight Modal -->
        <div class="modal fade" id="flightModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" name="close">
                            Close
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Flight Modal -->
        <div class="modal fade" id="accomModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" name="close">
                            Close
                        </button>
                    </div>
                </div>
            </div>
        </div>

    </modals>


    <jsp:include page="../components/footer.jsp"/>
    <jsp:include page="../components/scripts.jsp"/>
    <script src="${pageContext.request.contextPath}/js/tripsPage.js"></script>
</body>
</html>
