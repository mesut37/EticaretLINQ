

var menuids = new Array("KatMenu1");
var submenuoffset = -2;
var spReg;

$(document).ready(function () {
 
        
 
    var pintli = window.location.href;
    var pintimages = $("#imgUrunResim").attr("src");
    var pintdes = $(".ProductName h1").text();
    var b = window.location.hostname
    var av = b + pintimages;

    $('.ticiContainer.productDetailContainer .leftBlock ').addClass('UrunDetayLeft');
    $('.ticiContainer.productDetailContainer .rightBlock').addClass('UrunDetayRight');
    $('.ticiContainer.productDetailContainer .centerCount').addClass('UrunDetayCenter');




    $(".socialButons").append("<a href='//tr.pinterest.com/pin/create/button/?url=" + pintli + "&media=" + av + "&description=" + pintdes + "' data-pin-do='buttonPin' data-pin-config='none'><img src='//assets.pinterest.com/images/pidgets/pinit_fg_en_rect_gray_20.png' /></a><!-- Please call pinit.js only once per page --><script type='text/javascript' async src='//assets.pinterest.com/js/pinit.js'></script>");
    if ($.fn.fancybox)
        $(".fancybox").fancybox();

//    $('.KategoriFilitre input , .KategoriEksecenek input ').iCheck({
//       checkboxClass: 'checkboxStyle',
//       radioClass: 'iradio_minimal-grey',
//       increaseArea: '20%' // optional
//   }).on("ifClicked", function () {
//       $(this).click();
    //   });

    //Cari Rapor Print
    $('.CariRaporlarContent .fancybox').attr("rel", "gallery").fancybox({
        afterShow: function(){
            var win=null;
            var content = $('.fancybox-inner');
            $('.fancybox-wrap')
            // append print button
            .append('<div id="fancy_print"></div>')
            // use .on() in its delegated form to bind a click to the print button event for future elements
            .on("click", "#fancy_print", function(){
                win = window.open("width=200,height=200");
                self.focus();
                win.document.open();
                win.document.write('<'+'html'+'><'+'head'+'><'+'style'+'>');
                win.document.write('body, td { font-family: Verdana; font-size: 10pt;}');
                win.document.write('<'+'/'+'style'+'><'+'/'+'head'+'><'+'body'+'>');
                win.document.write(content.html());
                win.document.write('<'+'/'+'body'+'><'+'/'+'html'+'>');
                win.document.close();
                win.print();
                win.close();
            }); // on
        } //  afterShow
    }); // fancybox

    $('.Sayac').each(function () {
        $(this).countdown({
            until: $(this).attr("rel").toDateFromAspNet(), compact: true,
            description: ''
        });
    });

    //SolBlokF�rsatSlide
    $('.firsatUrunleri').each(function () {
        $(this).jCarouselLite({
            btnNext: $(this).find(".Firsatnext"),
            btnPrev: $(this).find(".Firsatprev"),
            auto: 800,
            speed: 2000
        });
    });

    $.each($(".jCarouselLite .lazy"), function (index, img) {
        $(img).attr("src", $(img).attr("data-original"));
    });
    //Scroll top
        if (!$('#back-to-top').length) {
            //create back to top
            $('body').append('<div id="back-to-top"><a href="#">Back to Top</a></div>');
        }
    $(window).scroll(function () {
        if ($(window).scrollTop() > 200) {
            $("#back-to-top").fadeIn(200);
        } else {
            $("#back-to-top").fadeOut(200);
        }
    });

    $('#back-to-top, .back-to-top').click(function () {
        $('html, body').animate({ scrollTop: 0 }, '800');
        return false;
    });

    //Validate
    $(".validate").append("<span class='validateOk'></span");
    $(".validateSol").append("<span class='validateSolOk'></span");
    $(".validateOrta").append("<span class='validateOrtaOk'></span");

    //�r�nDetayZoom
    CloudZoom.quickStart();
    $("#imgUrunResim").on("hover", function () {
        $(".cloudzoom-blank").children("div:last-child").hide();
    });
    $("#imgUrunResim").on("click", function () {
        $.fancybox.open($(this).data("CloudZoom").getGalleryList());
    });

    //�r�n Detay Tabl
    $(".urunTab li:eq(0)").addClass("active");
    $(".urunTab a").click(function () {
        var index = $(".urunTab a").index(this);
        $(".urunDetayPanel").hide();
        $(".urunTab li").removeClass("active");
        $(this).parent().addClass("active");
        $(".urunDetayPanel:eq(" + index + ")").show();
    });
    /****/
    $("#allBrands").click(function () {
        var $t = $(this);
        var $pItem = $(".brandItem");
        if ($t.hasClass("allBrandsActive")) {
            $(".productsHover").animate(
                { height: 2 * $pItem.height() + 2 },
                { duration: 500, queue: false }
            );
            $t.removeClass("allBrandsActive");
        } else {
            $(".productsHover").animate(
                { height: Math.ceil($pItem.length / 5) * $pItem.height() + 5 },
                { duration: 500, queue: false }
            );
            $t.addClass("allBrandsActive");
        }
    });


    
    $("#txtbxArama").keypress(function (evt) {
        var charCode = evt.charCode || evt.keyCode;
        if (charCode == 13) {
            if ($(this).val().trim().length > 0)
                window.location.href = "/arama/" + $(this).val();
            return false;
        }
    });
    $("#btnKelimeAra").click(function () {
        var url = "/arama";
        if ($("#txtbxArama").val().trim().length > 0)
            url += "/" + $("#txtbxArama").val();
        if ($("#ddlAramaKategori").length > 0) {
            if ($("#ddlAramaKategori").val() > 0) {
                url += "&kategori=" + $("#ddlAramaKategori").val()
            }
        }
        if (url != "/arama")
            window.location.href = url;
        return false;
    });


    var $elem = $("#txtbxArama").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "/Handlers/ACUrun.ashx?ozet=1",
                dataType: "json",
                data: {
                    featureClass: "P",
                    style: "full",
                    maxRows: 25,
                    searchKeyword: request.term
                },
                success: function (data) {
                    response($.map(data, function (item) {
                        return {
                            label: item.isim,
                            value: item.url
                        }
                    }));
                }
            });
        },
        appendTo: "#divArama",
        minLength: 3,
        select: function (event, ui) {
            window.location.href = ui.item.value;
            this.value = ui.item.label;
            return false;

        }
    });

    var elemAutocomplete = $elem.data("ui-autocomplete") || $elem.data("autocomplete");
    if (elemAutocomplete) {
        elemAutocomplete._renderItem = function (ul, item) {
            var newText = String(item.label).replace(
                    new RegExp(this.term, "gi"),
                    "<span class='ui-state-highlight'>$&</span>");

            return $("<li></li>")
                .data("item.autocomplete", item)
                .append("<a>" + newText + "</a>")
                .appendTo(ul);
        };
    }

    initSpeechReg();
});

/* Speech Recognation*/
var create_email = false;
var final_transcript = '';
var recognizing = false;
var ignore_onend;
var start_timestamp;
var recognition;
function initSpeechReg() {

    if (('webkitSpeechRecognition' in window)) {
        document.getElementById("start_button").style.display = 'inline-block';
        recognition = new webkitSpeechRecognition();
        recognition.continuous = true;
        recognition.interimResults = true;

        recognition.onstart = function () {
            recognizing = true;
            //showInfo('info_speak_now');
            document.getElementById("start_img").src = '/Scripts/speech/mic-animate.gif';
        };

        recognition.onerror = function (event) {
            if (event.error == 'no-speech') {
                document.getElementById("start_img").src = '/Scripts/speech/mic.gif';
                //showInfo('info_no_speech');
                ignore_onend = true;
            }
            if (event.error == 'audio-capture') {
                document.getElementById("start_img").src = '/Scripts/speech/mic.gif';
                //showInfo('info_no_microphone');
                ignore_onend = true;
            }
            if (event.error == 'not-allowed') {
                if (event.timeStamp - start_timestamp < 100) {
                    //showInfo('info_blocked');
                } else {
                    //showInfo('info_denied');
                }
                ignore_onend = true;
            }
        };

        recognition.onend = function () {
            recognizing = false;
            if (ignore_onend) {
                return;
            }
            document.getElementById("start_img").src = '/Scripts/speech/mic.gif';
            if (!final_transcript) {
                //showInfo('info_start');
                return;
            }
            //showInfo('');
            /*if (window.getSelection) {
                window.getSelection().removeAllRanges();
                var range = document.createRange();
                range.selectNode(document.getElementById('final_span'));
                window.getSelection().addRange(range);
            }*/
        };

        recognition.onresult = function (event) {
            var interim_transcript = '';
            final_transcript = '';
            if (typeof (event.results) == 'undefined') {
                recognition.onend = null;
                recognition.stop();
                //upgrade();
                return;
            }
            for (var i = event.resultIndex; i < event.results.length; ++i) {
                if (event.results[i].isFinal) {
                    final_transcript += event.results[i][0].transcript;
                } else {
                    interim_transcript += event.results[i][0].transcript;
                }
            }
            final_transcript = capitalize(final_transcript);

            document.getElementById("txtbxArama").value = linebreak(final_transcript);
            $("#txtbxArama").autocomplete("search");
            //interim_span.innerHTML = linebreak(interim_transcript);
            if (final_transcript || interim_transcript) {
                //showButtons('inline-block');
            }
        };
    }
    else {
        // Desteklemiyor.
        document.getElementById("start_button").style.display = 'none';
    }
}

function showInfo(s) {
    if (s) {
        for (var child = info.firstChild; child; child = child.nextSibling) {
            if (child.style) {
                child.style.display = child.id == s ? 'inline' : 'none';
            }
        }
        info.style.visibility = 'visible';
    } else {
        info.style.visibility = 'hidden';
    }
}

function startButton(event) {
    if (recognizing) {
        recognition.stop();
        return;
    }
    final_transcript = '';
    recognition.lang = 'tr-TR';
    recognition.start();
    ignore_onend = false;
    /*final_span.innerHTML = '';
    interim_span.innerHTML = '';*/
    document.getElementById("start_img").src = '/Scripts/speech/mic-slash.gif';
    //showInfo('info_allow');
    //showButtons('none');
    start_timestamp = event.timeStamp;
    return false;
}

var two_line = /\n\n/g;
var one_line = /\n/g;
function linebreak(s) {
    return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
}

var first_char = /\S/;
function capitalize(s) {
    return s.replace(first_char, function (m) { return m.toUpperCase(); });
}

/********/

//Ali yeni siparis adımı
$(document).ready(function () {
    if ($(window).width() > 960) { 
        $(".BasketPage").parents("body").addClass("sepetimBody");
        var a = $(".headerContent #logo").html();
        $(".sepetimBody .headerContent").html("<div id='logo'>" + a + "</div>");

        var headerHeight = $("#header").height();
        elem = $("body");

        if (elem.hasClass("sepetimBody")) {
            $('html, body').animate({ scrollTop: headerHeight }, 800);
        }
        var BasketAccountwidth = $(".BasketAccount").width();
        var BasketAccountheight = $(".BasketAccount").height();
        var windowWidth = $(window).width();
        var windowheight = $(window).height();
        var BasketPageWidth = $(".BasketPage").width();
        var BasketAccountRigth = (windowWidth - BasketPageWidth) / 2;
        //$(window).bind("scroll", function () {
        //    elem2 = $(window).scrollTop();
        //    if (BasketAccountheight > windowheight) {

        //    }
        //    else {
        //        if (elem2 > headerHeight) {
        //            if (BasketAccountheight > windowheight) {
        //                $(".BasketAccount").css({
        //                    position: "fixed",
        //                    right: BasketAccountRigth,
        //                    bottom: "10px",
        //                    width: BasketAccountwidth,
        //                    zIndex: "1000",
        //                    padding: "10px"
        //                });
        //            }
        //            else {
        //                $(".BasketAccount").css({
        //                    position: "fixed",
        //                    right: BasketAccountRigth,
        //                    top: "10px",
        //                    width: BasketAccountwidth,
        //                    zIndex: "1000",
        //                    padding: "10px"
        //                });
        //            }
        //        }
        //        else {
        //            $(".BasketAccount").css({
        //                position: "relative",
        //                top: "auto",
        //                right: "0"
        //            });
        //        }
        //    }
        //});
    }
});
//Ali yeni siparis adımı