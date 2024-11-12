

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Collection</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="css/home.css"/>


        <style>
            body {
                background-color: #f2f2f2;
                background-image: url(img/poster2.jpg);
                background-size: cover;
                background-repeat: no-repeat;
            }
            .card{
                margin: 10px 10px;
            }
            .listName{
                margin: 20px;
                font-weight: bolder;
                color: white;
                text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
            }
            
            .product{
                display: flex;
                justify-content: space-between;
            }
        </style>

    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>

           <div class="product">
            <c:forEach items="${listBestSellers}" var="o">
                <div class="card">
                    <a href="detail?proId=${o.proId}"> <img src="${o.proImg}" style="width:100%"> </a>
                    <a class="title" href="detail?proId=${o.proId}" style="padding: 1px 1px;" > ${o.proName}</a>
                    <p> ${o.proPrice} $</p>
                    <c:if test="${sessionScope.account.role == 1 || sessionScope.account.role == null }">
                        <p><button class="buy"><a href="addToCart?proId=${o.proId}&num=1" style="color: white">Add To Cart</a></button></p>

                    </c:if>
                    <c:if test="${sessionScope.account.role == 0}">
                        <div style="display: flex; justify-content: space-around; background-color: black; border-radius:10px ">
                            <div style="margin: 10px ;">
                                <a href="getproduct?proId=${o.proId}" style="color: white; padding: 10px ; font-family: 'Eczar', serif;">Edit</a>
                            </div>
                            <div style="margin: 10px ;">
                                <a href="delete?proId=${o.proId}" style="color: red; padding: 10px ; font-family: 'Eczar', serif;">Delete</a>
                            </div> 
                        </div>  

                    </c:if>


                </div>
            </c:forEach>
        </div>
                
    </body>
</html>
