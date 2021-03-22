//이미지 슬라이더
        $(".slider").slick({
            dots: true,
            autoplay: true,
            autoplaySpeed: 3000,
            arrows: false,
            responsive: [
                {
                    breakpoint: 768,
                    settings: {
                        arrows: true,
                        dots: false
                        }
                }
            ]
        });
            $(".slider1").slick({
            dots: true,
            autoplay: true,
            autoplaySpeed: 5000,
            arrows: false,
            infinite: true,
              slidesToShow: 3,
              slidesToScroll: 3,
            responsive: [
                {
                    breakpoint: 768,
                    settings: {
                        arrows: true,
                        dots: false
                        }
                }
            ]
        });  
            //접기/펼치기
            $(".btn").click(function(e){
                e.preventDefault();
                $(".nav").slideToggle();
                $(".btn").toggleClass("open");

                if($(".btn").hasClass("open")){
                    //open이 있을 때
                    $(".btn").find("i").attr("class","fa fa-angle-up");                
                } else {
                    //open이 없을 때
                    $(".btn").find("i").attr("class","fa fa-angle-down");
                }
            });