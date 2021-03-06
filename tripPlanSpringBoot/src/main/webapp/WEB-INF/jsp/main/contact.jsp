<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>
        <jsp:include page="../components/linksHeader.jsp"/>

    </head>
    <body>
        <jsp:include page="../components/navbar.jsp"/>

        <div class="hero-wrap js-fullheight" style="background-image: url('https://alpinecabinet.com/wp-content/uploads/2018/12/contact-background.jpg');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
                    <div class="col-md-9 text-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                        <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="${pageContext.request.contextPath}/">Home</a></span> <span>Blog</span></p>
                        <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Contact Us</h1>
                    </div>
                </div>
            </div>
            <a class="down-arrow" href="#start">
                <div class="arrow bounce d-none d-md-block">
                    <i class="fas fa-angle-down fa-3x" aria-hidden="true"></i>
                </div>
            </a>
        </div>

        <section id="start" class="ftco-section contact-section ftco-degree-bg ftco-animate">
            <div class="container">
                <div class="row d-flex mb-5 contact-info">
                    <div class="col-md-12 mb-4">
                        <h2 class="h4">Contact Information</h2>
                    </div>
                    <div class="w-100"></div>
                    <div class="col-md-3">
                        <p><span>Address:</span> <a target="_blank" href="https://www.google.com/maps/place/Omonoia+39,+Athina+105+64/@37.9807716,23.7300947,17z/data=!3m1!4b1!4m5!3m4!1s0x14a1bd3a371b1527:0xc814362af19d1764!8m2!3d37.9807716!4d23.7322834">Πανεπιστημίου 39,<br> 1ος όροφος,<br>Τ.Κ. 10564, Αθήνα</a></p>
                    </div>
                    <div class="col-md-3">
                        <p><span>Phone:</span> <a href="tel://1234567920">+30 210 60 87 264</a></p>
                    </div>
                    <div class="col-md-6">
                        <p><span>Email:</span> <a href="#">tripPlannerDemo@gmail.com</a></p>
                    </div>
                </div>
                <div class="row block-9">
                    <div class="col-md-6 order-md-last pr-md-5">
                        <form action="#">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Your Name">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Your Email">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Subject">
                            </div>
                            <div class="form-group">
                                <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
                            </div>
                        </form>

                    </div>

                    <div class="col-md-6">
                        <div id="map"><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d1111.8734290683103!2d23.732775172937295!3d37.980560549553495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sgr!4v1572558519810!5m2!1sen!2sgr" width="550" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe></div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section-parallax ftco-animate">
            <div class="parallax-img d-flex align-items-center">
                <div class="container">
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                            <h2>Subcribe to our Newsletter</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
                            <div class="row d-flex justify-content-center mt-5">
                                <div class="col-md-8">
                                    <form action="#" class="subscribe-form">
                                        <div class="form-group d-flex">
                                            <input type="text" class="form-control" placeholder="Enter email address">
                                            <input type="submit" value="Subscribe" class="submit px-3">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="../components/footer.jsp"/>
        <jsp:include page="../components/scripts.jsp"/>

    </body>
</html>
