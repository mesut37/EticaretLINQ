var urunDetay_varyasyonSecili = true;

function includeJs(jsFilePath) {

    var js = document.createElement("script");
    js.type = "text/javascript";

    js.src = jsFilePath;
    document.body.appendChild(js);

}

$(function ($) {
    var num_cols = 2,
    container = $('ul.columns'),
    listItem = 'li',
    listClass = 'sub-list';
    container.each(function () {

        var items_per_col = new Array(),
        items = $(this).find(listItem),
        min_items_per_col = Math.floor(items.length / num_cols),
        difference = items.length - (min_items_per_col * num_cols);
        for (var i = 0; i < num_cols; i++) {
            if (i < difference) {
                items_per_col[i] = min_items_per_col + 1;
            } else {
                items_per_col[i] = min_items_per_col;
            }
        }
        for (var i = 0; i < num_cols; i++) {
            $(this).append($('<ul ></ul>').addClass(listClass));
            for (var j = 0; j < items_per_col[i]; j++) {
                var pointer = 0;
                for (var k = 0; k < i; k++) {
                    pointer += items_per_col[k];
                }
                $(this).find('.' + listClass).last().append(items[j + pointer]);
            }
        }
    });
});


(function ($) {
    $.fn.dropDiv = function (options) {

        var defaults = {
            newSource: "",
            newHtml: "",
            kosul: "",
            after: false,
            before: false
        }

        var options = $.extend(defaults, options);

        return this.each(function () {

            var newHtml = options.newHtml;
            var oldHtml = this.outerHTML;

            var element = "";

            if ($("." + options.newSource + "").length > 0) {
                element = ".";
            } else if ($("#" + options.newSource + "").length > 0) {
                element = "#";
            } else if (true) {
                element = "";
            }

            if (options.after == false && options.before == false) {
                if (newHtml == "" && $(this).length > 0) {
                    $("" + element + "" + options.newSource + "").append(oldHtml);
                    $(this).remove();
                } else {
                    $("" + element + "" + options.newSource + "").append(newHtml);
                }

            } else if (options.after == true) {
                if (newHtml == "") {
                    $("" + element + "" + options.newSource + "").after(oldHtml);
                    $(this).remove();
                } else {
                    $("" + element + "" + options.newSource + "").after(newHtml);
                }
            } else if (options.before == true) {
                if (newHtml == "") {
                    $("" + element + "" + options.newSource + "").before(oldHtml);
                    $(this).remove();
                } else {
                    $("" + element + "" + options.newSource + "").before(newHtml);
                }
            }


        });
    };
})(jQuery);

$(window).resize(function () {
    var mobile = $(window).width();
    if (mobile < 768) {
        resizeR();
    }
});

$(document).ready(function () {



    includeJs("/CustomCss/modernizr.custom.js");

    var welcome = $("#divMemberPanel ul li").length;
    if (welcome > 1) {
        $(".welcome").css("display", "none");
    }
    else {
        $(".solUyeOl").css("display", "none");
        $(".solUyeGiris").css("display", "none");
    }

    $(".navigation").prepend("<span class='mobileNav'>Kategoriler<a class='btn-toogle' href='javascript:;'><i class='fa fa-bars'></i></a></span>");

    $(".btn-toogle").click(function () {
        $(".navigation > ul").slideToggle("slow");
    });

    $("#divFiltreKategoriler > div.KategoriFilitreTittle").text("Fitreleme");

    $(".productItem .productIcon").each(function () {
        if ($(this).find(".newIcon").length > 0) {
            var elm = $(this).find(".newIcon");
            $(this).find(".newIcon").remove;
            $(this).parent().append(elm);
        }
    });
    $(".productItem .productIcon").each(function () {
        if ($(this).find(".discountIcon").length > 0) {
            var elm = $(this).find(".discountIcon");
            $(this).find(".discountIcon").remove;
            $(this).parent().append(elm);
        }
    });

    $(".footerTop").dropDiv({
        newSource: "footerEmail"
    });

    $(".leftBlock .userMenu ").prepend("<span class='mobileNav'><a class='btn-toogle' href='javascript:;'><i class='fa fa-bars'></i></a></span>");

    if ($(window).width() < 991) {
        $(".yanResimliMenu").click(function () {
            $(".headerContent .yanResimliMenuContent").slideToggle("slow");
        });
    }

    $(".ticiContainer.homeContainer .ProductList ").prepend("");


    $(".lfMenu ul li").hover(
       function () {
           $('.lfMenuAltContent', this).fadeIn("fast");
       },
       function () {
           $('.lfMenuAltContent', this).fadeOut("fast");
       });

    $(".lfMenuAltContent").each(function () {
        if ($(this).has(".altMenu_List").length && $(this).has(".altMenu_Resim").length) {

            $(this).addClass("altMenu_List_Yes");
        } else {

        }
    });

    $(".lfMenuAltContent").each(function () {
        if ($(this).has(".altMenu_List").length) {

        } else {
            $(this).addClass("altMenu_List_No");
        }
    });
    $(".lfMenuAltContent").each(function () {
        if ($(this).has(".altMenu_Resim").length) {

        } else {
            $(this).addClass("altMenu_Resim_No");
        }
    });
    $(".lfMenu > ul > li").each(function (index) {
        if (index == 1) {
            $(this).find(".lfMenuAltContent").css("top", "-32px");
        }
    });
    $(".lfMenu > ul > li").each(function (index) {
        if (index == 6) {
            $(this).find(".lfMenuAltContent").css("top", "-187px");
        }
    });






    $("#txtbxArama").val("Arama...");
    $('#txtbxArama')
      .on('focus', function () {
          var $this = $(this);
          if ($this.val() == 'Arama...') {
              $this.val('');
          }
      })
      .on('blur', function () {
          var $this = $(this);
          if ($this.val() == '') {
              $this.val('Arama...');
          }
      });

    $(".sepetimBody .header-links").remove();

    $(".mycartIcon").removeClass("tip");

    var mobile = $(window).width();
    if (mobile < 768) {

        $(".ListemItem.satir").prepend("<div class='ListemItemTittle'></div>");

        $(".ListemItem.Title").dropDiv({
            newSource: "ListemItemTittle"
        });

        $("#imgUrunResim").removeClass("cloudzoom").removeAttr("data-cloudzoom");
        $("#imgUrunResim").unbind("click");
        $("#imgurunresmi").unbind("click");
        $(".SmallImages #imgurunresmi").click(function () {
            $("#imgUrunResim").attr("src", $(this).attr("src"));
        });

        $("#imgUrunResim").click(function () {
            $.fancybox.open($(this).attr("src"));
        });

    }

    $(".centerCount.UyelikBilgilerimContent .uyelikBilgilerimSpan").removeClass("row");
    $(".centerCount.UyelikBilgilerimContent .uyelikBilgilerimRow").addClass("row");
    $(".centerCount.UyelikBilgilerimContent .uyelikBilgilerimSpan").addClass("col-md-6 col-lg-6 col-xs-12 col-sm-12");

    $(".centerCount.DestekTaleplerimContent .DestekTaleplerimContentSpan").removeClass("row");
    $(".centerCount.DestekTaleplerimContent .DestekTaleplerimContentRow").addClass("row");
    $(".centerCount.DestekTaleplerimContent .DestekTaleplerimContentSpan").addClass("col-md-6 col-lg-6 col-xs-12 col-sm-12");

    $(".IadeTaleplerimContent .row").addClass("col-md-6 col-lg-6 col-xs-12 col-sm-12");

    $(".centerCount .SifremiUnuttumInput").addClass("row");

    $(".ProductDetail").addClass("row");
    $(".ProductDetail .categoryTitle").addClass("col-md-12 col-lg-12 col-xs-12 col-sm-12");
    $(".ProductDetailMain").addClass("col-md-12 col-lg-12 col-xs-12 col-sm-12");
    $(".ProductDetailMainRow").addClass("row");
    $(".leftImage").addClass("col-md-5 col-lg-5 col-xs-12 col-sm-5");
    $(".Images #imgUrunResim").addClass("img-responsive");

    $(".RightDetail").addClass("col-md-7 col-lg-7 col-xs-12 col-sm-7");
    $(".kampanyalar").addClass("col-md-12 col-lg-12 col-xs-12 col-sm-12");
    $(".productModule2").addClass("col-md-12 col-lg-12 col-xs-12 col-sm-12");
    $(".urunOzellik ").addClass("col-md-12 col-lg-12 col-xs-12 col-sm-12");
    $("#divBenzerUrun ul ").addClass("row");



    var kdvDahil = $("#pnlFiyatlar #divKDVDahilFiyat").length;
    var kdvDahilIndirimsiz = $("#pnlFiyatlar #divIndirimsizFiyat").length;


    if (kdvDahil > 0) {
        $(".IndirimliFiyatContent").css("display", "none");
    }
    else {
        $("#divIndirimsizFiyat").addClass("indirimsizkdvDahil");
    }
    if (kdvDahilIndirimsiz > 0) {
        $("#divIndirimsizFiyat .right_line span").css("text-decoration", "none");
    }

    var divAdetCombo = $("#divAdetCombo").length;

    if (divAdetCombo <= 0) {

        $(".Basketinp").prepend("<div class='basketBtnAdet'>Adet</div>");
    }
    $(".tip").tooltip({ placement: 'top', container: 'body' });
    $(".tipL").tooltip({ placement: 'top', container: 'body' });

    var divStokYok = $("#divStokYok").length;
    if (divStokYok > 0) {
        $(".ProductIcon").addClass("StokYok");
    }
    $(".TavsiyeEtBtn , .YorumYazbtnContent a").addClass("button");


    $(".BasketPage").addClass("col-md-12 col-lg-12 col-xs-12 col-sm-12");
    $(".Basketstep").addClass("col-md-12 col-lg-12 col-xs-12 col-sm-12");
    $(".BasketDetail").addClass("col-md-9 col-lg-9 col-xs-12 col-sm-12");
    $(".BasketAccount").addClass("col-md-3 col-lg-3 col-xs-12 col-sm-12");

    $(".BasketDetail .UyelikBilgilerimContent ").addClass("col-lg-12");


    var left = $('.leftBlock div').length;
    var right = $('.rightBlock div').length;
    if (left == 0) {
        if (right > 0) {
            $('.leftBlock').css('display', 'none');
            $(".rightBlock").addClass("col-md-3 col-lg-3 hidden-xs hidden-sm");
            $(".centerCount").addClass("col-md-9 col-lg-9 col-xs-12 col-sm-12");
            $(".productItem").addClass("col-md-6 col-lg-4 col-xs-12 col-sm-6");
            $(".tip").tooltip({ placement: 'top', container: 'body' });

        }
        else {
            $('.leftBlock').css('display', 'none');
            $('.rightBlock').css('display', 'none');
            $(".centerCount").addClass("col-lg-12 col-md-12 col-xs-12 col-sm-12");
            $(".productItem").addClass("col-md-4 col-sm-6 col-lg-3 col-xs-12");
            $(".tip").tooltip({ placement: 'top', container: 'body' });
        }
    }
    if (left > 0) {
        if (right > 0) {
            $('.leftBlock').addClass("col-lg-3 hidden-xs hidden-sm hidden-md");
            $(".rightBlock").addClass("col-lg-3 hidden-xs hidden-sm hidden-md");
            $(".centerCount").addClass("col-md-12 col-lg-6 col-sm-12 col-xs-12");
            $(".productItem").addClass("col-md-4 col-sm-6 col-lg-6 col-xs-12");
            $(".tip").tooltip({ placement: 'top', container: 'body' });
        }
        else {
            $('.rightBlock').css('display', 'none');
            $('.leftBlock').addClass("col-md-3 col-lg-3 hidden-xs hidden-sm");
            $('.leftBlock.hesabimLeft').removeClass("hidden-xs hidden-sm");
            $('.leftBlock.hesabimLeft').addClass("col-md-3 col-lg-3 col-xs-12 col-sm-12");
            $(".centerCount").addClass("col-md-9 col-lg-9 col-xs-12 col-sm-12");
            $(".productItem").addClass("col-md-6 col-lg-4 col-xs-12 col-sm-6");
            $(".tip").tooltip({ placement: 'top', container: 'body' });

        }
    }

    $('.ProductList .jCarouselLite').each(function () {
        $(this).jCarouselLite({
            btnNext: $(this).find(".ProductListnext"),
            btnPrev: $(this).find(".ProductListprev"),
            visible: 4,
            //auto: 2000,
            //speed: 1000,
        });
    });

    $.fn.radioBox = function () {
        var elm = $(this);
        elm.each(function (index) {
            var element = $(this);
            var radioBoxElement;
            var radioBoxPoint;
            element.on("init", function () {
                var radioBoxHTML = '<div class="radioBox"><span></span></div>';
                element.after(radioBoxHTML);
                element.hide();
                radioBoxElement = element.next(".radioBox");
                radioBoxPoint = radioBoxElement.find("span");
                element.trigger("valueChange");
                element.bind("change", function () {
                    if (element.attr("name")) {
                        $("input[name='" + element.attr("name") + "']").trigger("valueChange");
                    } else {
                        element.trigger("valueChange");
                    }
                    element.trigger("valueChange");
                });
                radioBoxElement.click(function () {
                    if (!element.is(":checked")) {
                        if (element.attr("name")) {
                            $("input[name='" + element.attr("name") + "']").attr("checked", false);
                            element.attr("checked", true);
                            $("input[name='" + element.attr("name") + "']").trigger("valueChange");
                        } else {
                            element.attr("checked", true).trigger("valueChange");
                        }
                    }
                });
            }).on("valueChange", function () {
                var ischecked = element.is(":checked");
                if (ischecked == true) {
                    radioBoxElement.attr("checked", true);
                } else {
                    radioBoxElement.attr("checked", false);
                }
            }).trigger("init");
        });
    }

    $(".KategoriFilitreLine table input").radioBox();

    var kendinTasarla = $(".basketBtn a").text();

    if (kendinTasarla == "Kendin Tasarla")
    {
        $("#divAdetCombo").css("margin-bottom", "15px");
        $("#divAdetCombo").css("margin-left", "0px");


    }


});



