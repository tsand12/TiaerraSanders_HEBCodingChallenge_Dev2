
var app = angular.module("myApp", ["ngAnimate"]);
app.controller("homeCtrl", function($scope, $http) {

	$scope.groceryItems = null;
	$scope.showAdvancedSearch = false;
	$scope.disableSingleSearchBtn = false;
	$scope.searchPressed = false;
	$scope.showNoResultsFound = false;
  
    
    $scope.getSearchData = function(btnPressed){
    	$scope.showNoResultsFound = false;
    	$scope.searchPressed = true;
    	var sendingEmptyParams = true;
    	$scope.groceryItems=null;
    	var idVal = document.getElementById("idInput");
    	var idObj = null;
    	var descVal = document.getElementById("descInput");
    	var descObj = null;
    	var singSearchVal = document.getElementById("singleSearch");
    	var singSearchObj = null;
    	var lsVal = document.getElementById("lastSoldInput");
    	var lsObj = null;
    	var slVal = document.getElementById("shelfLifeInput");
    	var slObj = null;
    	var deptVal = document.getElementById("deptInput");
    	var deptObj = null;
    	var priceVal = document.getElementById("priceInput");
    	var priceObj = null;
    	var unitVal = document.getElementById("unitInput");
    	var unitObj = null;
    	
    	if(btnPressed != "singleSearch"){
			singSearchVal.value = "";
		}
    	
    	if(idVal){
			if(idVal.value != ""){
				idObj = idVal.value;
				sendingEmptyParams = false;
			}
    	}
    	if(descVal){
    		if(descVal.value != ""){
	    		descObj = descVal.value;
	    		sendingEmptyParams = false;
    		}
    	}else if(singSearchVal){
    		if(singSearchVal.value != ""){
	    		descObj = singSearchVal.value;
	    		sendingEmptyParams = false;
    		}
    	}
    	if(lsVal){
    		if(lsVal.value != ""){
	    		lsObj = lsVal.value;
	    		sendingEmptyParams = false;
    		}
    	}
    	if(slVal){
    		if(slVal.value != ""){
	    		slObj = slVal.value;
	    		sendingEmptyParams = false;
    		}
    	}
    	if(deptVal){
    		if(deptVal.value != ""){
	    		deptObj = deptVal.value;
	    		sendingEmptyParams = false;
    		}
    	}
    	if(priceVal){
    		if(priceVal.value != ""){
	    		priceObj = priceVal.value;
	    		sendingEmptyParams = false;
    		}
    	}
    	if(unitVal){
    		if(unitVal.value != ""){
	    		unitObj = unitVal.value;
	    		sendingEmptyParams = false;
    		}
    	}
    	var queryData = {
    		id: idObj,
    		description:descObj,
    		lastSold: lsObj,
    		shelfLife: slObj,
    		department:deptObj,
    		price: priceObj,
    		unit: unitObj,
			xFor: null,
			cost: null
    	}
    	
    	var data = JSON.stringify(queryData);
    	if(sendingEmptyParams){
    		if(btnPressed == "singleSearch"){
    			$scope.showSingleSearchErrorMessage = true;
    		}else{
    			$scope.showAdvancedSearchErrorMessage = true;
    		}
    		
    	}else{
    		$http({
                method : 'GET',
                url : 'GroceryServlet',
                params: {
                	queryData: JSON.stringify(queryData)
                },
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(function mySucc(response){
            	$scope.groceryItems = response.data;
            	if($scope.groceryItems.length == 0 || $scope.groceryItems == null){
            		$scope.showNoResultsFound = true;
            	}
               
            })
            .catch(function(error) {
                // Catch and handle exceptions from success/error/finally functions
            });
    	}
    	
    }
    $scope.searchClick = function(){
        $scope.showHiddenText = true;


    }
    
    $scope.showHideAdvancedSearch = function(){
    	$scope.showAdvancedSearch = !$scope.showAdvancedSearch;
    }
    $scope.isOneSelected = function(fieldSelected){
 //   	idSelected ? oneSelected == true:oneSelected ==false"
    	if(fieldSelected){
    		$scope.oneSelected = true;
    	}else{
    		$scope.oneSelected = false;
    	}
    	
    }


});
