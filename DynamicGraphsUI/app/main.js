(function () {
    'use strict';

    angular
    .module('app')
    .controller('Main', function ($scope, $http) {
        $scope.onSeriesHover = function (e) {
            kendoConsole.log(kendo.format("event :: seriesHover ({0} : {1})", e.series.name, e.value));
        };

        $scope.electricity = new kendo.data.DataSource({
            transport: {
                read: {
                    url: "../Content/test.json",
                    dataType: "json"
                }
            },
            sort: {
                field: "year",
                dir: "asc"
            }
        });
        //define scope variable here.

    });

})();
