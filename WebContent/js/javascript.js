// 企业Name 超过 header后 显示
function NameOverflowHeader() {
  var $t = $('.title');
  var t_w = $('.title_wrap');
  var t_h = $('.header_desc .title').height();
  var t_w_h = $('.title_wrap').height();
  var rest_h = t_h - t_w_h;
  var n_div = $('.name_overflow_div');
  var imgdiv = $('.imgdiv');
  var t_text = $('.title').text();

  TitleDdd();

  $('.title_wrap').on('click', function() {

    t_w.toggleClass('opened');
    if (t_w.hasClass('opened')) {
      t_w.trigger('destroy');
      imgdiv.addClass('imgdiv_overflow_initial');
      t_w.addClass('title_wrap_overflow_initial');
      n_div.css('height', rest_h);
      freelogo();
    } else {
      t_w.dotdotdot();
      imgdiv.removeClass('imgdiv_overflow_initial');
      t_w.removeClass('title_wrap_overflow_initial');
      n_div.css('height', '0');
      freelogo();
    }
    return false;

  });
};
function freelogo(){
  if($('.cli_support').length>0)
  {
    var height=$('#cli_content').height();
    var clientHeight=document.documentElement.clientHeight;
    if(height<clientHeight){
      $('body').css({'position':'relative','min-height':clientHeight+'px'});
      $('.cli_support').addClass('cli_support_a');
    }else{
      $('.cli_support').removeClass('cli_support_a');
    }
  }
}
function TitleDdd() {
  $('.title_wrap').each(function() {
    var w_h = $(this).height();
    var $t = $('.title');
    if ($t.outerHeight() > w_h) {
      $('.title_wrap').dotdotdot();
    };
  });
};
NameOverflowHeader();

// 企业码标题里不出现 换行符 br
function TitleNoBr() {
  var title = $('title').text();
  var new_title = title.replace(/<br [\/]>/g, "");

  $('title').text(new_title);

};
TitleNoBr();

var dh_num; /*导航的列*/
function dh_col(dh_num) {
  if (typeof dh_num == "undefined") {
    dh_num = 2;
  }
  $(".dm_contenter").each(function() {
    var w_w = document.documentElement.clientWidth;
    var w_w2 = $(this).parent().width();
    if (w_w2 < w_w) {
      w_w = w_w2;
    }
    var dm_span4_count = $(this).find('.dm_span4').length;
    var dm_row_num = Math.ceil(dm_span4_count / dh_num);
    var grid_h_h;
    if (dh_num == 2) {
      grid_h_h = 60;
    } else {
      grid_h_h = w_w / dh_num;
    }
    var grid_h = grid_h_h * dm_row_num;
    var dm_span4_w = (w_w - dh_num) / dh_num;
    $(this).css({
      "height": grid_h + "px",
      "margin-bottom": "15px"
    }).show();
    $(this).find(".dm_content").css({
      "height": grid_h + "px",
      "width": w_w + "px"
    }).show();
    $(".dm_contenter").parent(".tree_box").css("box-shadow", "none");
    $(".dm_span4").each(function() {
      $(this).css({
        "width": dm_span4_w + "px",
        "height": (grid_h_h - 1) + "px"
      }).show();

      var a = $(this).find(".dm_span4_div1");
      var b = $(this).find(".dm_span4_div2");
      $(this).find('img').autoSize(40, 40).show();
      if (dh_num == 2) {
        a.css({
          "height": "40px",
          "width": "40px",
          "display": "inline-block",
          "vertical-align": "middle",
          "margin-left": "10px",
          "margin-right": "10px"
        }).show();
        b.css({
          "display": "inline-block",
          "vertical-align": "middle",
          "height": "60px",
          "width": (parseInt(dm_span4_w) - 60) + "px"
        }).show();
        b.find("h2").css({
          "line-height": "60px"
        }).show();
      } else if (dh_num == 3 || dh_num == 4) {
        a.css({
          "height": 0.68 * dm_span4_w + "px",
          "width": dm_span4_w + "px",
          "vertical-align": "middle",
          "display": "table-cell"
        }).show();
        b.css({
          "height": 0.32 * dm_span4_w + "px",
          "text-align": "center"
        }).show();
        $(this).css("text-align", "center");
      } else if ( dh_num == 1 ) {   //一行一列
        $(this).parent("a").css('display','block');
        $(this).css({
          "width": "100%",
          "height": "auto",
          "display": "table-row"
        });
        $(this).parent().parent(".dm_content").css({
          "height": "auto",
          "width": "100%"
        });
        $(this).parent().parent().parent('.dm_contenter').css("height","auto");

        a.css({
          // "height": "auto",
          "width": "20%",
          "vertical-align": "middle",
          "display": "table-cell",
          "padding": "5px 0",
          "float": "left",
          "display": "table-cell"
        }).show();

        b.css({
          "height": "40px",
          "text-align": "left",
          "padding": "5px 0",
          "display": "table-cell",
          "vertical-align": "middle"
        });

        b.find("h2").css({
          "white-space": "normal",
          "vertical-align": "middle",
          "word-break": "break-all"
        });


        $(this).css("text-align", "center");
      }
    });
  });
}

function show_qr() {
  qr_wrap = document.getElementById("qr_wrap");
  if (qr_wrap.style.display == 'none') {
    qr_wrap.style.display = 'block';
  } else {
    qr_wrap.style.display = 'none';
  }

}

function show_face() {
  $('#mcover_vard_face').show();
  $('.vcard_biz_face_wrap,.vcard_biz_career').hide();
  $('.vcard_biz_head').css('min-height', '0');
}

function show_info() {
  $('#mcover_vard_face').hide();
  $('.vcard_biz_face_wrap,.vcard_biz_career').show();
  $('.vcard_biz_head').css('min-height', '250px');
}
$(function() {
  $(".halffold_text_sl").each(function(i) {
    var divH = $(this).height();
    var $p = $("p", $(this)).eq(0);
    while ($p.outerHeight() > divH) {
      $p.text($p.text().replace(/(s)*([a-zA-Z0-9]+|W)(...)?$/, "..."));
    };
  });
  var text = $('.desc');
  var tree = $('.tree_box');

  var resize_vcard_biz_face = function() {
    var vcard_face = $('#vcard_biz_face_img');
    var vcard_face_src = vcard_face.attr('src');
    var imgs = new Image();
    imgs.src = vcard_face_src;
    imgs.onload = function() {
      if (imgs.width > imgs.height) {
        var vcard_face_w = 120;
        var vcard_face_h = imgs.height * 120 / imgs.width;
        var vPosition = '0' + (vcard_face_w - vcard_face_h) / 2 + 'px';
      } else if (imgs.width < imgs.height) {
        var vcard_face_h = 120;
        var vcard_face_w = imgs.width * 120 / imgs.height;
        var vPosition = (vcard_face_h - vcard_face_w) / 2 + 'px' + ' 0';

      } else {
        var bgPosition = '0 0';
        var vcard_face_w = vcard_face_h = 120;
      }
      $('#vcard_biz_face_img_show').css({
        "background-image": "url(" + vcard_face_src + ")",
        "background-size": vcard_face_h + 'px ' + vcard_face_h + 'px',
        "background-position": vPosition,
        "background-repeat": 'no-repeat',
        "width": vcard_face_w + 'px',
        "height": vcard_face_h + 'px',
        "border-radius": '60px'

      });

    }
  }
  $(function() {
    /*离职背景判断*/
    var u = navigator.userAgent,
      app = navigator.appVersion;
    var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1; //android不支持模糊效果
    if (isAndroid) {
      $('#lizhibg').css('background', "rgba(1, 1, 1,0.82)");
    }

    if (($("#Ofold").length > 0)) {
      $("#Ofold").next().find(".tree_box_content").hide();
    }
    if ($('.vcard_biz_head').attr('databg')) {
      var image = new Image(),
        src = $('.vcard_biz_head').attr('databg');
      image.onload = function() {
        $('.vcard_biz_head').css({
          'background-image': 'url(' + src + ')'
        });
      }
      image.src = src;
    }
    var h = document.documentElement.clientHeight;
    $("#tools").css("display", "none");
    $(window).scroll(function() {
      var windowScrollTop = $(window).scrollTop();
      var oTools = $("#tools");
      if (windowScrollTop > 100) {
        oTools.fadeIn();
      } else {
        oTools.fadeOut();
      }
    });
    $(".scroll_top").css("bottom", 0.15 * h + "px");
    $(".scroll_top").click(function() {
      window.scrollTo(0, 0);
    });
    //resize_vcard_biz_face();
  });

  function show_content(obj) {
    $(obj).next().slideToggle('fast').css('overflow', 'initial');
    $(obj).toggleClass('show_content');
    $(obj).toggleClass('hider');
    $(obj).toggleClass('shower');
    if (typeof myscroll != 'undefined') {
      myscroll._resize();
    }
  }

  function show2_content(obj) {
    $(obj).parent().hide();
    $(obj).parent().next().slideToggle('fast').css('overflow', 'initial');
    if (typeof myscroll != 'undefined') {
      myscroll._resize();
    }
  }

  function show3_content(obj) {
    $(obj).parent().hide();
    $(obj).parent().prev().slideToggle('fast').css('overflow', 'initial');;
    $("html,body").animate({
      scrollTop: $(obj).parent().prev().offset().top
    }, 500);
    if (typeof myscroll != 'undefined') {
      myscroll._resize();
    }
  }

  function show4_content(obj) {
    $(obj).hide();
    $(obj).parent().next().slideToggle('fast');
    if (typeof myscroll != 'undefined') {
      myscroll._resize();
    }
  }

  function show5_content(obj) {
    $(obj).parent().hide();
    $(".reg_show_div1").show();
    $("html,body").animate({
      scrollTop: $(obj).parent().parent().offset().top
    }, 500);
    if (typeof myscroll != 'undefined') {
      myscroll._resize();
    }

  }

  function show6_content(obj) {
    if ($(obj).next().children().css('display') == 'none') {
      var height = $(window).height();
      var width = $(window).width();
      $(obj).removeClass('hider').addClass('shower');
      $(obj).next().children().css('display', 'block');
      var t = $(obj);
      var ul = t.next().find("ul");
      var li = ul.children("li");
      li.css("width", "100%");
      var firstimg = true;
      var realHeight;
      var width = document.body.clientWidth;
      var li_num = t.find(".li_img").length;
      li.each(function() {
        var img = new Image();
        var _t = $(this).find("img");
        $(this).css('width', width + 'px');
        var y_src = _t.attr('src');
        _t.attr('src', y_src + '?t=' + Math.random());
        $(this).find(".tit").css("width", width);
        img.onload = function() {
          var imgheight = _t.height();
          if (firstimg) {
            firstimg = false;
            realHeight = imgheight;
            ul.height(realHeight);
            ul.css("height", realHeight + "px");
            li.height(realHeight);
          }
          if (imgheight < realHeight) {
            realHeight = imgheight;
            ul.css("height", realHeight + "px");
            li.height(realHeight);
          }
        }
        img.src = _t.attr('src');
      });
    } else {
      $(obj).next().children().css('display', 'none');
      $(obj).removeClass('shower').addClass('hider');
    }
  }
  window.show_content = show_content;
  window.show2_content = show2_content;
  window.show3_content = show3_content;
  window.show4_content = show4_content;
  window.show5_content = show5_content;
  window.show6_content = show6_content;


  /*音频播放*/
  $('.audio_play_box').each(function(i) {
    var aud = $(this).find(".aud");
    $(this).find('.play').bind('click', function(evt) {
      /*填入音频地址*/
      if (aud.attr('src') == undefined) {
        aud.attr('src', aud.attr('data_src')).removeAttr('data_src');
      }
      if (aud[0].paused) {
        $('.audio_play_box').each(function() {
          $(this).find('audio')[0].pause();
          $(this).find(".audio").removeClass('audio_stop_btn').addClass('audio_play_btn');
        });
        evt.preventDefault();
        aud[0].play();
        $(this).find(".audio").removeClass('audio_play_btn').addClass('audio_stop_btn');
      } else if (aud[0].paused == false) {
        evt.preventDefault();
        aud[0].pause();
        $(this).find(".audio").removeClass('audio_stop_btn').addClass('audio_play_btn');
      }

    });
    /*添加监听，在播放结束时*/
    aud[0].addEventListener('ended', function(evt) {
      $(".audio").removeClass('audio_stop_btn').addClass('audio_play_btn');
    });
  });

  function stopBubble(e) {
    // 如果传入了事件对象，那么就是非ie浏览器  
    if (e && e.stopPropagation) {
      //因此它支持W3C的stopPropagation()方法  
      e.stopPropagation();
    } else {
      //否则我们使用ie的方法来取消事件冒泡  
      window.event.cancelBubble = true;
    }
  }

  /*防伪溯源提交和结果返回*/
  function afatra_submit(id, input_len) {
    var a_id = id;
    var input_name_str = 'afatra_input_' + id + '_';
    var param = new Array();
    for (var i = 0; i < input_len; i++) {
      var input = document.getElementById(input_name_str + i);
      param.push(input.name + '=' + input.value);
    }
    var param_str = param.join('&');

    $.post('/Afatra/query/id/' + a_id, param_str, function(response) {
      var resp = response;
      var resp_txt = '';
      if (resp.status != '' && resp.status !== undefined) {
        resp_txt = response.info;
      } else {
        r_len = resp.length;
        for (i = 0; i < r_len; i++) {
          resp_txt += '<p>' + resp[i].name + '：<span class="afatra_res_val">' + resp[i].vals + '</span></p>';
        }
      }
      var w_w = $(window).width();
      var w_h = $(window).height();
      var dialog_width = w_w - 30;
      var dialog_height = w_h - 40;
      var dialog_top = (w_h - dialog_height) / 2;
      var dialog_left = (w_w - dialog_width) / 2;

      document.getElementById("content_tree").innerHTML += '<div id="afatra_dialog" style="height:' + dialog_height + 'px;width:' + dialog_width + 'px;top:' + dialog_top + 'px;left:' + dialog_left + 'px"><div id="afatra_dialog_title" style="height: 32px; box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.1),0 1px 0 0 rgba(0, 0, 0, 0.1); font-size: 20px; text-align: center; background: #EBEBEB; padding: 10px; ">查询结果</div><div id="afatra_dialog_close"><a style="display: block;" href="javascript:forclose();"></a></div><div class="dialog_content">' + resp_txt + '</div><a href="javascript:forclose();" class="btn-orange btn" style="padding: 8px; display: block; width: 50%; margin: 0 auto; text-align: center;">关闭</a></div>';
    })
  }
});

function set_descr() {
  var descr_w = $(".desc_title  span").width();
  //alert(descr_w);
  var innertext2_w = $(".desc_title ").width();
  //alert(innertext2_w);
  if (descr_w > (innertext2_w - 12))
    $(".desc_title ").css("text-align", "left");
  else
    $(".desc_title ").css("text-align", "center");
}
set_descr();

$(window).load(function() {
  var w_w = $(window).width();
  //alert(w_w);
  $(".halffold_img").each(function() {
    var n = $(this);
    var halffold_img = n.find(".halffold_img_img");
    var halffold_img_h = halffold_img.height();
    var halffold_img_w = halffold_img.width();
    //  alert(halffold_img_h);
    //  alert(halffold_img_w);

    var h = w_w * halffold_img_h / halffold_img_w;
    var mt_w = -(h - 100) / 2;
    halffold_img.css({
      "width": "100%",
      "margin-top": mt_w
    });

    // alert("调试中");
  })
});


function set_halffold_text() {
  $(".halffold_text").each(function() {
    var m = $(this);
    var halffold_text_sl = m.find(".halffold_text_sl").text();
    str = halffold_text_sl.replace(/&lt;[^>].*?&gt;/g, "");
    m.find(".halffold_text_sl").html(str);
  })
}
set_halffold_text();

function no_header() {
  var halffold = $('.tree_box:first').find('.halffold');
  var tree_box_content = $('.tree_box:first').find('.tree_box_content');
  var tree_box_title = $('.tree_box:first').find('.tree_box_title');
  var no_title = $('.tree_box:first').find('.no_title');

  if (halffold) {
    halffold.css('margin-top', '0px');
    tree_box_content.css('margin-top', '0px');
  }
  if (tree_box_title) {
    tree_box_title.css('margin-top', '0px');
  }
  if (no_title) {
    no_title.css('margin-top', '0px');
  }
}
no_header();

/*轮播脚本*/
$(function() {
  $(".banner_img").each(function() {
    var t = $(this);
    var ul = t.children("ul");
    var li = ul.children("li");
    li.css("width", "100%");
    var firstimg = true;
    var realHeight;
    var width = document.body.clientWidth;
    var li_num = t.find(".li_img").length;
    li.each(function() {
      var img = new Image();
      var _t = $(this).find("img");
      $(this).find(".tit").css("width", width);
      img.onload = function() {
        var height = document.documentElement.clientHeight;
        var imgheight = _t.height();
        if (firstimg) {
          firstimg = false;
          realHeight = imgheight;
          ul.height(realHeight);
          ul.css("height", realHeight + "px");
          li.height(realHeight);
        }
        if (imgheight < realHeight) {
          realHeight = imgheight;
          ul.css("height", realHeight + "px");
          li.height(realHeight);
        }
      }
      img.src = _t.attr('src');
    });
    if (li_num > 1&&!t.hasClass('header_banner')) {
      t.unslider({
        dots: true, //  Display dot navigation
      });
      var dotsL = t.children(".dots").children("li").length;
      t.children(".dots").css("width", 20 * dotsL + "px");
      t.children(".dots").css("margin", "0 auto");
    } else {
      t.unslider({
        dots: false, //  Display dot navigation
      });
    }
  });
  var unslider = $('.banner').unslider({
    arrows: false,
    speed: 500, //  The speed to animate each slide (in milliseconds)
    delay: 3000, //  The delay between slide animations (in milliseconds)
    complete: function() {}, //  A function that gets called after every slide animation
    // keys: true,               //  Enable keyboard (left, right) arrow shortcuts
    fluid: true //  Support responsive design. May break non-responsive designs
  });
  if ($("#vcard_download").length > 0) { /*名片页的下载*/
    $("#cli_content").css("padding-bottom", "50px");
  }
  $(window).load(dh_col(dh_num));
  if ($(".banner").length > 0) {
    var t = $(".banner").find("img");
    t.each(function() {
      var t1 = $(this).parent("a");
      if (t1.attr("href") == "") {
        $(this).bind("click", function(event) {
          event.preventDefault();
        });
      }
    });
    jQuery('.banner ul')
      .on('movestart', function(e) {
        // If the movestart is heading off in an upwards or downwards
        // direction, prevent it so that the browser scrolls normally.
        if ((e.distX > e.distY && e.distX < -e.distY) ||
          (e.distX < e.distY && e.distX > -e.distY)) {
          e.preventDefault();
        }
      });
  }
  $(window).load(function(){      /*图片加载后需要草料二维码技术支持自适应*/
      freelogo();
  });


  $('#load_record').bind('click',function(){
    var t=$(this),
        more_data={
          'product_id':product_id,
          'startnum':t.attr('startnum')
        }
    $.post('/pro/get_record_more',more_data,function(ret){
      if (ret.status==1) {
        if (ret.data.list) {
          var html=[];
          for(var i=0,length=ret.data.list.length;i<length;i++){
            var html1='<div class="record_box">\
                        <div class="tree_box_content" style="margin-top: 0px;">\
                          <div class="regcontact">\
                            <div class="regcontact1">';
            for(var j=0,length1=ret.data.list[i].length;j<length1;j++){
              if (ret.data.list[i][j].field_type=='picupload') {
                html1+='<div class="regpicupload">\
                        <div class="regpicupload_name">'+ret.data.list[i][j].field_name+'</div>\
                        <div class="regpicupload_value"><image src="'+ret.data.list[i][j].value+'"></div>\
                      </div>';
              }else if(ret.data.list[i][j].field_type=='group'){
                html1+='<div class="reggroup">\
                        <div class="reggroup_name">\
                          <h2>'+ret.data.list[i][j].field_name+'</h2>\
                        </div>\
                      </div>';
              }else if(ret.data.list[i][j].field_type=='textarea'){
                html1+='<div class="regtextarea">\
                          <div class="regtextarea_name">'+
                            ret.data.list[i][j].field_name+
                          '</div>\
                          <div class="regtextarea_value">'+
                            ret.data.list[i][j].value+
                          '</div>\
                        </div>'
              }else{
                html1+='<div class="reginput">\
                        <div class="reginput_name">'+ret.data.list[i][j].field_name+'</div>\
                        <div class="reginput_value">'+ret.data.list[i][j].value+'</div>\
                      </div>';
              }
            }
            html1+='</div></div></div></div>';
            html.push(html1);
          }
          t.attr('startnum',parseInt(t.attr('startnum'))+length);
          t.parent().parent().before(html.join(''));
          if (!ret.data.hasmore) {
            t.parent().parent().remove();
          }
        }
      }else{

      }
    },'json');
  });
});

$('#add_record').bind('click',function(){
    if($('#record_list').length>0){

    }else{
      var bg = '<div class="fix_bg"></div><div class="loading_tips">载入中，请稍候</div>';
      var box = '<div class="select_record_box">\
                  <h1 class="title">记录模板</h1>\
                  <select id="record_list"></select>\
                  <div class="arrow"></div>\
                  <div class="btn_group">\
                    <a href="javascript:;" class="cacel">取消</a>\
                    <a href="javascript:;" class="submit">确定</a>\
                  </div>\
                </div>';
      $('body').append(bg);
    }
    var _datalist = '';
    $.post('/pro/get_record_list_by_productid',{product_id:product_id},function(ret){
        if(ret.status==1 && !!ret.data){
          if (ret.data.length==1) {
            var id=ret.data[0]['record_template_id']
            var back = window.location.href;
            var form = '<form action="/pro/dumptoform"><input type="hidden" name="id" value="'+id+'" /><input type="hidden" name="back" value="'+back+'" /><input type="hidden" name="product_id" value="'+product_id+'" /></form>';
            $(form).appendTo($('body')).submit();
            return;
          }
            $('.loading_tips').remove();
            var return_data = ret.data;
            for(var i in return_data){
              _datalist += '<option value="'+return_data[i]['record_template_id']+'">'+return_data[i]['name']+'</option>';
            }
            $(box).appendTo('body').find("#record_list").append(_datalist);
            $('.select_record_box .cacel').bind('click',function(){
              $(this).parents('.select_record_box').prev('.fix_bg').remove();
              $(this).parents('.select_record_box').remove();
            });
            $('.select_record_box .submit').bind('click',function(){
               var id = $('#record_list').val();
               var back = window.location.href;
               var form = '<form action="/pro/dumptoform"><input type="hidden" name="id" value="'+id+'" /><input type="hidden" name="back" value="'+back+'" /><input type="hidden" name="product_id" value="'+product_id+'" /></form>';
               $(form).appendTo($('body')).submit();
            });
        }else if(ret.status==1 && !ret.data){
          alert("你没有添加记录权限，请联系管理员");
          $('.loading_tips,.fix_bg').remove();
        }else if (ret.status==-1){
          alert(ret.info);
          $('.loading_tips,.fix_bg').remove();
        }else if(ret.status==-2){
          var login=$('<div id="login_dia">\
                        <div class="login_item">\
                          <label>用户名：</label><input type="text" name="username" id="username">\
                        </div>\
                        <div class="login_item">\
                          <label>密码：</label><input type="password" name="password" id="password">\
                        </div>\
                        <div class="login_btn">\
                          <a id="login_btn">登陆</a>\
                        </div>\
                      </div>').appendTo('body');
          $('.loading_tips').remove();
          $('#login_btn').bind('click',function(){
            var post_data={};
            post_data.account=$('#username').val();
            post_data.password=$('#password').val();
            var reg=new RegExp("(biz.cli.im|biz.cli.me|biz.cliim.net|biz.cliim.com|pro.cliim.net)","g");   
            if (window.location.href.match(reg)) {
              console.log(data);
              post_data.user_id=data.user_id;
              $.post("/Sonuser/User/login",post_data,function(ret){
                if (ret.status==1) {
                  $('#login_dia').remove();
                  $('#add_record').click();
                }else{
                  alert(ret.info);
                }
              },'json');
            }else{
              $.post("/Sonuser/User/login",post_data,function(ret){
                if (ret.status==1) {
                  $('#login_dia').remove();
                  $('#add_record').click();
                }else{
                  alert(ret.info);
                }
              },'json');
            }
          });
          $('.fix_bg').bind('click',function(){
            $('#login_dia,.fix_bg').remove();
          });
        }
    });

});