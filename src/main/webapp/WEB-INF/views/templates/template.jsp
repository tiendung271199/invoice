<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/components/taglib.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <title>INVOICE</title>
    
    <c:url value="/resources" var="contextPath" scope="application" ></c:url>
    
    <link rel="shortcut icon" type="image/ico" href="${contextPath}/images/icon-180x180.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="${contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link href="${contextPath}/css/style1.css" rel="stylesheet">
    <link href="${contextPath}/fontawesome-free/css/all.min.css" rel="stylesheet">
    
    <script type="text/javascript" src="${contextPath}/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/jquery.validate.min.js"></script>
  </head>
  
  <c:url value="/" var="urlIndex" scope="application" ></c:url>
  <c:url value="/" var="urlInvoice" scope="application" ></c:url>
  
  <body>
  	<div class="header">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</div>
	
    <div class="page-content">
    	<div class="row">
		  <div class="col-md-2">
		  	<div class="sidebar content-box" style="display: block;">
				<tiles:insertAttribute name="leftbar"></tiles:insertAttribute>
             </div>
		  </div>
		  <div class="col-md-10">
			  <tiles:insertAttribute name="body"></tiles:insertAttribute>	
		  </div>
		</div>
    </div>

      <footer>
          <tiles:insertAttribute name="footer"></tiles:insertAttribute>
      </footer>

    <script src="${contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${contextPath}/js/custom.js"></script>
  </body>
</html>