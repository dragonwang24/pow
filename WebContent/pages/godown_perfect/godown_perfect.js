/**
 * Created by fall on 2015/12/9.
 */
var godownPerfect = angular.module('godownPerfect', []);
godownPerfect.controller('godownPerfectCtrl', function ($scope, $http) {
    $scope.coser = {
        name: "系渡人",
        url:"../cosplay/godown_perfect/23.png",
        zl: [
            {url: '../cosplay/godown_perfect/46.png', count: 23},
            {url: '../cosplay/godown_perfect/46.png', count: 25},
            {url: '../cosplay/godown_perfect/46.png', count: 20},
            {url: '../cosplay/godown_perfect/46.png', count: 2}
        ]
    };
});
