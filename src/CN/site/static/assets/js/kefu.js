
!(function() {
    var serviceOnline = (function() {
        var sideContent = document.querySelector(".side_content");
        var show_btn = document.querySelector(".show_btn");
        var close_btn = document.querySelector(".close_btn");
        var timer = null;

        var startMove = function(argument) {
            var scrollsidebar = document.getElementById("scrollsidebar");
            clearInterval(timer);
            timer = setInterval(function() {
                var speed = (argument - scrollsidebar.offsetTop) / 4;
                speed = speed > 0 ? Math.ceil(speed) : Math.floor(speed);
                if (argument == scrollsidebar.offsetTop) {
                    clearInterval(timer);
                } else {
                    var style_top =  scrollsidebar.offsetTop + speed;
                    if (style_top>280){
                        scrollsidebar.style.top = 280+"px";
                    }
                    else{
                        scrollsidebar.style.top = scrollsidebar.offsetTop + speed + "px";   
                    }
                    
                }
            }, 20);
        };

        var scrollMove = function() {
            window.onscroll = window.onload = function() {
                var scrollsidebar = document.getElementById("scrollsidebar");
                var scrolltop =
                    document.body.scrollTop || document.documentElement.scrollTop;
                startMove(
                    parseInt(
                        (document.documentElement.clientHeight -
                            scrollsidebar.offsetHeight) /2 +scrolltop
                    )
                );
            };
        };

        var slideShow = function() {
            if (!show_btn) return false;
            show_btn.addEventListener(
                "click",
                function() {
                    show_btn.style.width = 0;
                    sideContent.style.width = "154px";
                },
                false
            );
        };

        var slideClose = function() {
            if (!close_btn) return false;
            close_btn.addEventListener(
                "click",
                function() {
                    console.log(this);
                    sideContent.style.width = 0;
                    show_btn.style.width = "25px";
                },
                false
            );
        };

        return {
            init: function() {
                scrollMove();
                slideClose();
                slideShow();
            }
        };
    })();

    //��ʼ��
    serviceOnline.init();
})();