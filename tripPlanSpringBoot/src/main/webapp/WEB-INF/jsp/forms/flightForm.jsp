<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flight Form</title>

        <jsp:include page="../components/linksHeader.jsp"/>

        <link rel="stylesheet" href="../css/autocomplete.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>

    <body>
        <jsp:include page="../components/navbar.jsp"/>
       
        <div class="hero-wrap js-fullheight" style="background-image: url('https://cdnstatic1.eskypartners.com/backgrounds/main_page/hero_main_3_1.jpg');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start"
                     data-scrollax-parent="true">
                    <div class="col-md-8 ftco-animate mb-5 pb-5 text-center text-md-left"
                         data-scrollax=" properties: { translateY: '70%' }">
                        <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Plan <br>Your Flight
                        </h1>
                        <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Find great prices to fly and explore the world</p>
                    </div>
                    
                    <div class="col-md-4 ftco-animate mb-5 pb-5 text-center text-md-left"
                         data-scrollax=" properties: { translateY: '70%' }">
                        <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }" style="font-size: 30px;"> ${errorFlight}
                        </h1>
                        
                    </div>
                    
                </div>
            </div>
        </div>

        <section class="ftco-section justify-content-end ftco-search animated fadeInUpBig">
            <div class="container justify-content-center">
                <div class="row no-gutters">
                    <div class="col-md-12 nav-link-wrap">
                        <div class="nav nav-pills justify-content-center text-center" id="v-pills-tab" role="tablist"
                             aria-orientation="vertical">
                            <a class="nav-link active" id="v-pills-1-tab" data-toggle="pill" role="tab"
                               aria-controls="v-pills-1" aria-selected="true">Flight</a>
                        </div>
                    </div>
                    <div class="col-md-12 tab-wrap">

                        <div class="tab-content pb-0 px-5" id="v-pills-tabContent">

                            <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel"
                                 aria-labelledby="v-pills-nextgen-tab">
                                <spring:form  id="flightForm" modelAttribute="flight" action="${pageContext.request.contextPath}/flight/postRegister" method="GET"
                                              class="search-destination">
                                    <div class="d-flex form-row pt-2">
                                        <div class="form-group my-auto">
                                            <spring:radiobutton path="type" id="butt1" style="transform: scale(1.5);" class="m-2" value="oneWay" checked="checked"/>
                                            <label for="">One Way</label>
                                            <spring:radiobutton  path="type" id="butt2" style="transform: scale(1.5);" class="m-2 ml-4" value="roundTrip"/>
                                            <label for="">Round trip</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">From</label>
                                                <div class="form-field">
                                                    <div class="icon"><span class="icon-map-marker"></span></div>
                                                    <input type="text" class="autocomplete form-control" required placeholder="From *">
                                                    <spring:hidden id="originPlace" path="originPlace" />
                                                </div>
                                            </div>
                                        </div>
                                        <div  class="d-flex align-items-center mt-3">                                         
                                            <i id="glif" class="fa fa-exchange"></i>          
                                        </div>   
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">To</label>
                                                <div class="form-field">
                                                    <div class="icon"><span class="icon-map-marker"></span></div>
                                                    <input type="text" class="autocomplete form-control" required="required" placeholder="To *">
                                                    <spring:hidden id="destinationPlace" path="destinationPlace"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">Depart</label>                           
                                                <div class="form-field" >
                                                    <div class="icon"><span class="far fa-calendar-alt"></span></div>          
                                                        <spring:input autocomplete="off" path="outboundDate" cssClass="form-control checkin_date" required="required"  type="text" placeholder="Depart *" />
                                                </div>
                                            </div>
                                        </div>                
                                        <div id="return" class="col-md align-items-end d-none">
                                            <div  class="form-group">
                                                <label id="labelinbounddate" for="#">Return</label>
                                                <div  class="form-field ">
                                                    <div class="icon"><span class="far fa-calendar-alt"></span></div>                                                 
                                                    <input autocomplete="off" id="inboundDate" name="inboundDate"   class="form-control checkout_date "  type="text" placeholder="Return *" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md align-self-end">
                                            <div class="form-group">
                                                <div class="form-field">
                                                    <input type="submit" value="Search"
                                                           class="form-control btn btn-primary">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </spring:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <jsp:include page="../components/scripts.jsp"/>
        <script
            src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"
            integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk="
        crossorigin="anonymous"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/flightJs.js"></script>
        <%session.removeAttribute("errorFlight");%>
    </body>

</html>
