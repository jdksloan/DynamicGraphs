(function () {
    'use strict';

    angular
    .module('app')
    .controller('Main', function ($scope, $http) {
        
        $scope.graphData = new kendo.data.DataSource({
            transport: {
                read: {
                    url: "/api/graph",
                    dataType: "json"
                }
            },
            sort: {
                field: "year",
                dir: "asc"
            }
        });

        $http({
            method: 'GET',
            url: '/api/CPBWav'
        }).then(function successCallback(response) {
            $scope.selectedNumber = response.data;
        }, function errorCallback(response) {
            console.log("error", response);
        });

    });

})();


