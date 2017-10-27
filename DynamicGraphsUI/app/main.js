(function () {
    'use strict';

    angular
    .module('app')
    .controller('Main', function ($scope, $http) {
        $scope.onSeriesHover = function (e) {
            kendoConsole.log(kendo.format("event :: seriesHover ({0} : {1})", e.series.name, e.value));
        };

        $http({
            method: 'GET',
            url: '/api/Graph'
        }).then(function successCallback(response) {
            $scope.electricity = new kendo.data.DataSource({
                data: JSON.parse(response.data),
                sort: {
                    field: "year",
                    dir: "asc"
                }
            });
        }, function errorCallback(response) {
            console.log("error", response);
        });

    });

})();


