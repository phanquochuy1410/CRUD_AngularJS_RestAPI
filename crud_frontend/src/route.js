var app = angular.module("myModule", ["ngRoute"]);
app.config(function ($routeProvider, $locationProvider) {
  $locationProvider.hashPrefix("");
  $routeProvider
    .when("/show", {
      templateUrl: "pages/home.html",
      controller: NhanVienController,
    })
    .when("/find-all", {
      templateUrl: "pages/home.html",
      controller: NhanVienController,
    })
    .when("/add", {
      templateUrl: "pages/home.html",
      controller: NhanVienController,
    })
    .when("/update/:id", {
      templateUrl: "pages/home.html",
      controller: NhanVienController,
    })
    .when('/detail/:id', {
      templateUrl: "pages/home.html",
      controller: NhanVienController,
    })
    .when("/delete/:id", {
      templateUrl: "pages/home.html",
      controller: NhanVienController,
    })
    .otherwise({
      redirectTo: "/show",
    });
});
