<%@page import="org.apache.catalina.User"%>
<%@page import="model.Review"%>
<%@page import="java.util.List"%>
<%@page import="model.Account"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>360 View</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/flick/jquery-ui.css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"
                integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT"
        crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

        <link rel="stylesheet" type="text/css" href="css/reviewForm.css">
        <link rel="stylesheet" type="text/css" href="css/detail.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css" rel="stylesheet">






    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="container">
                        <div class="card">
                            <div class="row">
                                <aside class="col-sm-5 border-right">
                                    <article class="gallery-wrap">
                                        <div class="img-big-wrap">
                                            <div><a href="#"><img src="${detail.image}" alt="Product Image"></a></div>
                                        </div>
                                        <div class="img-small-wrap"></div>
                                    </article>
                                </aside>
                                <aside class="col-sm-7">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3">${detail.name}</h3>
                                        <p class="price-detail-wrap">
                                            <span class="price h3 text-danger">
                                                <span class="currency">$</span><span class="num">${detail.price}</span>
                                            </span>
                                        </p>
                                        <dl class="item-property">
                                            <dt>Description</dt>
                                            <dd><p>${detail.description}</p></dd>
                                        </dl>
                                        <div class="btn-group-custom">
                                            <a href="addandcart?productId=${detail.id}" class="btn btn-lg btn-primary text-uppercase">Buy now</a>
                                            <a href="addcart?productId=${detail.id}" class="btn btn-lg btn-outline-primary text-uppercase"><i class="fas fa-shopping-cart"></i> Add to cart</a>
                                            <button type="button" class="btn btn-lg btn-info text-uppercase" data-toggle="modal" data-target="#view360Modal">View 360</button>
                                        </div>
                                        <div class="btn-group-custom">
                                            <a href="homecontroll" class="btn btn-lg btn-secondary text-uppercase">Back to Home</a>
                                        </div>
                                    </article>
                                </aside>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal 360 View -->
        <div class="modal fade" id="view360Modal" tabindex="-1" role="dialog" aria-labelledby="view360ModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="view360ModalLabel">360 View</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div id="360-view" style="width: 100%; height: 600px; background-size: contain; background-repeat: no-repeat; background-position: center;"></div>
                        <div id="slider" style="margin-top: 20px;"></div>
                    </div>
                </div>
            </div>
        </div>






        <!-- Display Reviews -->
        <div id="reviews" class="reviews-section">
            <h4 class="text-center">Review ${detail.name}</h4>

            <div class="average-rating">
                <span class="rating-score">
                    <fmt:formatNumber value="${averageRating}" type="number" minFractionDigits="1" maxFractionDigits="1"/>
                </span>
                <span class="stars">
                    <c:forEach begin="1" end="5" varStatus="status">
                        <c:set var="filled" value="${status.index <= averageRating ? 'full' : (status.index - 1 < averageRating && averageRating < status.index ? 'partial' : '')}"/>
                        <span class="star ${filled}" style="--percent: ${averageRating % 1 * 100}">
                            <i class="fas fa-star"></i>
                        </span>
                    </c:forEach>
                </span>
                <span class="total-reviews">${totalReviews} Reviews</span>
            </div>

            <div class="rating-distribution">
                <c:if test="${ratingDistribution != null}">
                    <c:forEach var="i" items="${ratingRange}">
                        <div class="rating-bar">
                            <span class="star-label">${i}<i class="fas fa-star"></i> </span>
                            <div class="bar-container">
                                <div class="filled-bar" style="width: ${ratingDistribution[i - 1]}%; background-color: #f39c12;"></div>
                            </div>
                            <span class="percentage-label">${ratingDistribution[i - 1]}%</span>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
            <!-- Move the Write Review button here -->
            <c:if test="${not empty acc && acc.role eq 'us'}">
                <button id="write-review-btn" class="btn btn-primary btn-sm">Write Review</button>
            </c:if>
            <c:if test="${empty acc || acc.role ne 'us'}">
                <p>You need <a href="Login.jsp">Login</a> to leave a review.</p>
            </c:if>

            <div id="review-section" style="display: none;">

                <form action="submitReview" method="POST" enctype="multipart/form-data" class="review-form" onsubmit="return validateForm()">
                    <div class="rating-section">
                        <img src="${detail.image}" alt="${detail.name}" class="product-image">
                        <p>${detail.name}</p>
                        <div class="rating-stars">
                            <input type="radio" id="star5" name="rating" value="5"  />
                            <label for="star5" title="Very Good"><i class="fas fa-star"></i></label>
                            <input type="radio" id="star4" name="rating" value="4"  />
                            <label for="star4" title="Good"><i class="fas fa-star"></i></label>
                            <input type="radio" id="star3" name="rating" value="3"  />
                            <label for="star3" title="Normal"><i class="fas fa-star"></i></label>
                            <input type="radio" id="star2" name="rating" value="2"  />
                            <label for="star2" title="Bad"><i class="fas fa-star"></i></label>
                            <input type="radio" id="star1" name="rating" value="1"  />
                            <label for="star1" title="So Bad"><i class="fas fa-star"></i></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <textarea id="comment" class="form-control" name="comment" rows="3" placeholder="Share Your Thinking..." ></textarea>
                    </div>
                    <div class="form-group">
                        <label for="image">Upload Images:</label>
                        <input type="file" id="image" class="form-control" name="image" multiple>
                    </div>
                    <input type="hidden" name="productId" value="${detail.id}">
                    <button type="submit" class="btn btn-primary">Send Review</button>
                </form>
            </div>

            <script>
                function validateForm() {

                    if (!$('input[name="rating"]:checked').val()) {
                        alert('Please rate the product.');
                        return false;
                    } else {
                        return true;
                    }
                }
            </script>


            <!-- Display Reviews -->
            <c:forEach var="review" items="${reviews}">
                <div class="review">
                    <div class="user-info">
                        <p class="user-name"><strong>${userNames[review.userID]}</strong></p>

                        <div class="rating-stars-display">
                            <c:forEach begin="1" end="5" varStatus="status">
                                <i class="fas fa-star" style="color: ${status.index <= review.rating ? '#f39c12' : '#ddd'};"></i>
                            </c:forEach>
                        </div>
                    </div>

                    <p>${review.comment}</p>

                    <c:if test="${not empty review.imagePath}">
                        <div class="review-image">
                            <a href="${pageContext.request.contextPath}/${review.imagePath}" data-lightbox="review-images" data-title="${review.comment}">
                                <img src="${pageContext.request.contextPath}/${review.imagePath}" alt="Review Image" class="img-thumbnail">
                            </a>
                        </div>
                    </c:if>
                </div>
            </c:forEach>
        </div>



        <script>
            $(document).ready(function () {
                $('#write-review-btn').click(function () {
                    $('#review-section').toggle();
                });
            });
        </script>


















        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
        <script src="js/jquery.rotate360.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js"></script>
    </body>
</html>
