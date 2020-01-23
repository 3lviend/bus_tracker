$(document).ready(function(){

  $('.sidebar-expander').click(function(){
    $('.page-sidebar').toggleClass('active')
    $('.mobile-navbar').removeClass('active')
  })

  $('.header-collapser').click(function(){
    $('.mobile-navbar').toggleClass('active')
    $('.page-sidebar').removeClass('active')
  })

  $(window).resize(function(){
    $('.page-sidebar').removeClass('active')
    $('.mobile-navbar').removeClass('active')
  })

})