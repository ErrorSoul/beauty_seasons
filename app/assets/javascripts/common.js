$(document).ready(function() {
	$('#open-popup').magnificPopup({
    items: {
      src: '#my-popup',
      type: 'inline'
    }
  });

	$('.open-gallery-link').click(function() {

  var items = [];
  $('.popup-gallery').find('a').each(function() {
    items.push( {
      src: $(this).attr('href')
    } );
  });

  $.magnificPopup.open({
    items:items,
		type: 'image',
    gallery: {
      enabled: true
    }
  });
	});

	$('.div-trigger').click(function(e){
		$('.div-trigger').removeClass('active');
		$(this).addClass('active');
		var id = $(this).attr('id');
		var elem = $('[data-id=' + id + ']');
		$('.hide-class').hide();
		elem.show();

	});

	$("a.page-scroll").click(function (){
		var id = $(this).attr('href');
    	$('html, body').animate({
    		scrollTop: $(id).offset().top
      }, 2000);
	});

	$('a.to-news').click(function(e) {
		e.preventDefault();
		$('.div-trigger').removeClass('active');
		$('#news.div-trigger').addClass('active');
		$('.hide-class').hide();
		$('[data-id=news]').show();

		var id = $(this).attr('href');
		$('.item-news').removeClass('active');
		$('#' + id + '.item-news').addClass('active');
		$('html, body').animate({
			scrollTop: $('#page-1').offset().top
		}, 2000);
	});


});
