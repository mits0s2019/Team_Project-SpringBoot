
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="img/logo.png" alt=""></a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="nav-item"><a href="${pageContext.request.contextPath}/admin/administration">Dashboard</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/admin/pages">Pages</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/admin/posts">Posts</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/admin/administrators">Administrators</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/admin/users">Users</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Welcome, <span id="username">${pageContext.request.userPrincipal.name}</span></a></li>
                <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<header id="header">
    <div class="container">
        <div class="row">
            <div class="col-md-10">
                <h1><img src="https://image.flaticon.com/icons/svg/201/201623.svg" style="width:40px;"/> Dashboard <small> Manage Your
                        Site</small>
                </h1>
            </div>
            <div class="col-md-2">
                <div class="dropdown create">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="true">
                        Add to Website
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li><a type="button" data-toggle="modal" data-target="#addPage">Add Page</a></li>
                        <li><a type="button" data-toggle="modal" data-target="#addPost">Add Post</a></li>
                        <li><a type="button" data-toggle="modal" data-target="#addUser">Add User</a></li>
                        <li><a type="button" data-toggle="modal" data-target="#addAdmin">Add Administrator</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>