<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<!-- <script src="jquery-3.3.1.min.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.0/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.0/angular-animate.js"></script>
    	<script src="WebApp/js/home.js"></script>
    <!-- <link rel="stylesheet" type="text/css" href="app.css">-->
	
    <link rel="stylesheet" type="text/css" href="Content/css/app.css" />
    


    <title>Groceries | Home</title>
<!-- 
<title>Insert title here</title> -->
</head>
<body ng-app="myApp" ng-controller="homeCtrl"  style="background-color: #fffff0">
	
	
	<header>
	    <!-- <img alt="randomFoodPics" src=""> -->
	    <div id="bg">
		 <img src="https://picsum.photos/900/400?image=292" alt="">
		</div>
	    <h1>Welcome!</h1>
	
	</header>

<!--search box-->
<main class="col-xs-12 col-md-12 col-lg-12" style="position:absolute">
	<div class="container col-xs-12 col-md-12 col-lg-12"><!--class="search-bar container"-->
    <!--search-->
    <div class="row">
        <div class="col-xs-12 col-md-12 col-lg-12">
            <!-- <form action="#" method="get">-->
            <div >
	            <form style="margin:12px:">
	             	<input id="singleSearch" name="searchbar" type="search" placeholder="Search for an item..." required="required" autocomplete="on" ng-pattern-restrict="/^[0-9a-zA-Z/ -]+$/" ng-focus="showAdvancedSearch = false; disableSingleSearchBtn = false; showSingleSearchErrorMessage = false"/>
	                <button  type="submit" value="Search"  ng-click= "showAdvancedSearch = false;getSearchData('singleSearch')" ng-disabled="disableSingleSearchBtn">Search</button>
					<!-- <input type="submit" value="Send"/> -->
				</form>
				<!-- <p ng-if = "showSingleSearchErrorMessage" style="color:red">Can't perform empty search</p> -->
               <a  href="" ng-click="showAdvancedSearch = !showAdvancedSearch; disableSingleSearchBtn = !disableSingleSearchBtn" style="color:#0099cc">Advanced Search</a><br />
                <!-- <p ng-if="showHiddenText == true" style="color: red">You clicked the search button</p> -->
            </div>
            <!--</form>-->
        </div>
    </div>
    
    <!-- Advanced search -->
    <div ng-if="showAdvancedSearch" >
    	<div>
    		<form ><!-- action="GroceryServlet" -->
    			<p>Search By: </p><br />
    			<input name= "idCheckBox" type="checkbox" ng-model="idSelected" ng-click="isOneSelected(idSelected)" style="margin:0; padding:0"/><span style="margin:0; padding:0">ID </span>  <input class="advancedSearchText" id="idInput" ng-if="idSelected" name="groceryId" type="search" ng-model="groceryId" ng-pattern="/^[0-9a-zA-Z/ -]+$/" required="idSelected ? required:''" autocomplete="on"/><br />
    			<input name= "descCheckBox" type="checkbox" ng-model="descSelected" ng-click="isOneSelected(descSelected)"/> <span>DESCRIPTION </span> <input id="descInput" class="advancedSearchText" ng-if="descSelected" name="description" ng-model="description" type="search" ng-pattern="/^[0-9a-zA-Z/ -]+$/" required="descSelected ? required:''" autocomplete="on"/><br />
    			<input name= "lastSoldCheckBox" type="checkbox" ng-model="latSoldSelected" ng-click="isOneSelected(latSoldSelected)"/> <span>LAST SOLD </span> <input id="lastSoldInput" class="advancedSearchText" ng-if="latSoldSelected" name="lastSold" ng-model="lastSold" type="search" ng-pattern="/^[0-9a-zA-Z/ -]+$/" required="latSoldSelected ? required:''" autocomplete="on"/><br />
    			<input name= "shelfLifeCheckBox" type="checkbox" ng-model="shelfLifeSelected" ng-click="isOneSelected(shelfLifeSelected)"/> <span>SHELF LIFE </span> <input id="shelfLifeInput" class="advancedSearchText" ng-if="shelfLifeSelected" name="shelfLife" ng-model="shelfLife" type="search" ng-pattern="/^[0-9a-zA-Z/ -]+$/" required="shelfLifeSelected ? required:''" autocomplete="on"/><br />
    			<input name= "deptCheckBox" type="checkbox" ng-model="deptSelected" ng-click="isOneSelected(deptSelected)"/> <span>DEPARTMENT </span> <input id="deptInput" ng-if="deptSelected" class="advancedSearchText" name="department" type="search" ng-model="department" ng-pattern="/^[0-9a-zA-Z/ -]+$/" required="deptSelected ? required:''" autocomplete="on"/><br />
    			<input name= "priceCheckBox" type="checkbox" ng-model="priceSelected" ng-click="isOneSelected(priceSelected)"/> <span>PRICE </span> <input id="priceInput" ng-if="priceSelected" class="advancedSearchText" name="price" type="search" ng-model="price" ng-pattern="/^[0-9a-zA-Z/ -]+$/" required="priceSelected ? required:''" autocomplete="on"/><br />
    			<input name= "unitCheckBox" type="checkbox" ng-model="unitSelected" ng-click="isOneSelected(unitSelected)"/> <span>UNIT </span> <input id="unitInput" ng-if="unitSelected" class="advancedSearchText" name="unit" type="search" ng-model="unit" ng-pattern="/^[0-9a-zA-Z/ -]+$/" required="unitSelected ? required:''" autocomplete="on"/><br />
    			
	            <button  id ="submitBtn" ng-disabled="!oneSelected" type="submit" ng-click="getSearchData('advancedSearch')">Search</button>
	           <!--  <p ng-if = "showAdvancedSearchErrorMessage" style="color:red">Can't perform empty search</p> -->
    		</form>
    	</div>
    </div>

	<div style="overflow-x:auto;">
		  <!--table to display results--> 
    <table  id="table" ng-if="groceryItems.length > 0" id="groceryTable" border="1" class="col-xs-12 col-md-12 col-lg-12">
        <tr id="tableColHeadings">
            <th>ID</th>
            <th>DESCRIPTION</th>
            <th>LAST SOLD</th>
            <th> SHELF LIFE</th>
            <th> DEPARTMENT</th>
            <th>PRICE</th>
            <th>UNIT</th>
            <th>XFOR</th>
            <th>COST</th>
        </tr>
        <tbody ng-repeat="item in groceryItems">
        <tr id="cellData">
            <!--<tr><td>{{item.id}}</td><td>{{$index}}</td></tr>-->
            <!--<tr ng-repeat="e in i.details">-->
            <td>{{item.id}}</td>
            <td>{{item.description}}</td>
            <td>{{item.lastSold}}</td>
            <td>{{item.shelfLife}}</td>
            <td>{{item.department}}</td>
            <td>{{item.price}}</td>
            <td>{{item.unit}}</td>
            <td>{{item.xFor}}</td>
            <td>{{item.cost}}</td>

        </tr>
        </tbody>


        <!-- <td></td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>-->


        </tr>
    </table>
    <p id="noResults" ng-if="showNoResultsFound" class="col-xs-12 col-md-12 col-lg-12">No Results Found!</p>
	</div>
  
</div>
</main>

	<footer class="footer navbar-fixed-bottom">
	    <!-- <img alt="randomFoodPics" src=""> -->
	    
	    
	
	</footer>

</body>

</html>