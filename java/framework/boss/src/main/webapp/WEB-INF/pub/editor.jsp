
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>微型、开源的Bootstrap所见即所得（WYSIWYG）富文本编辑器 -- 由MindMup贡献</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="keywords" content="编辑器,在线编辑器,富文本编辑器,所见即所得编辑器,opensource rich wysiwyg text editor jquery bootstrap execCommand html5" />
    <meta name="description" content="这个微型的JQuery Bootstrap WYSIWYG 插件能将任何DIV变为HTML5富文本编辑器" />

    <link rel="apple-touch-icon" href="//mindmup.s3.amazonaws.com/lib/img/apple-touch-icon.png" />
    <link rel="shortcut icon" href="http://mindmup.s3.amazonaws.com/lib/img/favicon.ico" >
    <link href="http://twitter.github.com/bootstrap/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
    <link href="index.css" rel="stylesheet">
    
  </head>
  <body>

<div class="container">
  <div class="hero-unit">
  <div class="pull-right">
	<div class="fb-like" data-href="http://facebook.com/mindmupapp" data-send="false" data-layout="button_count" data-width="100" data-show-faces="false"></div><br/>
    <a href="https://twitter.com/mindmup" class="twitter-follow-button" data-show-count="true" data-show-screen-name="true" data-lang="en">Follow @mindmup</a> 
  </div>
	<h1>bootstrap-wysiwyg <br/> <small>为Bootstrap定制的微型所见即所得（What you see is what you get）富文本编辑器</small></h1>
    <hr/>
    <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
      <div class="btn-group">
        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="icon-font"></i><b class="caret"></b></a>
          <ul class="dropdown-menu">
          </ul>
        </div>
      <div class="btn-group">
        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
          <ul class="dropdown-menu">
          <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
          <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
          <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
          </ul>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
        <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
        <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="icon-strikethrough"></i></a>
        <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="icon-list-ul"></i></a>
        <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="icon-list-ol"></i></a>
        <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
        <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="icon-indent-right"></i></a>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
        <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
        <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
        <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
      </div>
      <div class="btn-group">
		  <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a>
		    <div class="dropdown-menu input-append">
			    <input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
			    <button class="btn" type="button">Add</button>
        </div>
        <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>

      </div>
      
      <div class="btn-group">
        <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="icon-picture"></i></a>
        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
        <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
      </div>
      <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
    </div>

    <div id="editor">
      Go ahead&hellip;
    </div>
  </div>

<div class="row">
    <div class="span6">
          <h2>关于</h2>
          <p>
          这个<a href="https://github.com/mindmup/bootstrap-wysiwyg/blob/master/bootstrap-wysiwyg.js">jQuery Bootstrap小插件（5KB, &lt; 200 行代码）</a>可以将任何一个DIV转变成一个WYSIWYG富文本编辑器，灵感来自于 <a href="http://premiumsoftware.net/cleditor/">CLEditor</a> 和
              <a href="http://jhollingworth.github.com/bootstrap-wysihtml5/">bootstrap-wysihtml5</a>. 
          下面是他的主要特色：
      </p>
          <ul>
            <li>在Mac和Wndows平台上能够自动针对常用操作绑定标准热键</li>
            <li>可以通过拖拽插入图片；支持图片上传（也可以获取移动设备上的照片）</li>
            <li>语音识别输入（仅限Chrome浏览器）</li>
            <li>允许自定义工具条；不生成额外标签；支持网站充分利用Bootstrap、Font Awesome等工具库的优秀特性</li>
            <li>没有强制规定的样式 - 一切都由你做主</li>
            <li>依赖浏览器的标准特性，没有非标准代码；工具条和键盘功能均可定制，并且能够执行任何<a href="https://developer.mozilla.org/en/docs/Rich-Text_Editing_in_Mozilla">浏览器支持的命令</a></li>
            <li>不会自己创建一个单独的frame、备份文本区等 - 本编辑器尽量保持简单，并仅仅运行在一个DIV内</li>
            <li>（可选）清除尾部空格；清除空的div和span</li> 
            <li>必须运行在现代浏览器上（在Chrome 26、Firefox 19、Safari 6上经过测试，用户报告称可以在IE10上工作）</li>
            <li>支持移动设备浏览器（在IOS 6 Ipad/Iphone 和 Android 4.1.1 Chrome上测试过）</li>
          </ul>


        <h2>Why?</h2>

        <a href="http://www.mindmup.com"><img class="span5" src="promo-868x350.png"></a>
        <br clear="all" />
        <p>
          While building a content editor for <a href="http://www.mindmup.com">MindMup</a> we found plenty of good HTML5 WYSWYG editors online, but most were duplicating
          functionality that already exists in JQuery and Bootstrap, implementing things that were meanwhile added to HTML5 and supported in major browsers, 
          or doing too much magic such as inserting IFrames with backup text-areas. Most of this was to work around quirks in older browsers (which we didn't need) and 
          caused focus problems on touch devices (which was an issue for us). Too much magic caused problems with 
          bootstrap modals (a must for us). Most editors also build their own toolbars, which embed additional CSS and images and always 
          turn out to be much worse than standard Bootstrap buttons. </p>
          <p>It turns out, with HTML5, everything we need can fit into less than 5K. We built this tiny tiny editor that does everything we need, does not impose
          any particular additional CSS and uses modern browser functionality without reimplementing JQuery and Bootstrap. </p>
          <p>It's released under the MIT license, so fork and enjoy!  </p>



    </div>
    <div class="span6" >
      <h2>使用方法</h2>
      <pre class="prettyprint linenums">$('#editor').wysiwyg();</pre>    
<p>不要忘了给容纳编辑器的div设置样式：</p>
<pre class="prettyprint linenums">
 #editor {overflow:scroll; max-height:300px}
</pre>
<p>如果你希望在移动设备浏览器上使用此编辑器，一定要看看
<a href="https://github.com/mindmup/bootstrap-wysiwyg#styling-for-mobile-devices">如何设置样式</a>才能针对移动设备屏幕做优化并提升用户体验（很不幸，本页面中的编辑器并没有针对移动设备做优化）。</p>

      <p>你还可以为编辑器创建一个工具条（请在本页面点鼠标右键查看源码，本页面就是一个很好的案例）：</p>
<pre class="prettyprint linenums">
&lt;div class="btn-toolbar" data-role="editor-toolbar"
        data-target="#editor"&gt;
  ...
&lt;/div&gt; 
</pre>
<p>通过在工具条上添加一个带有data-edit属性的链接（a标签），可以让其执行简单的命令。<p>
<pre class="prettyprint linenums">
  &lt;a data-edit="bold"&gt;...&lt;/a&gt;
</pre>
<p>为了执行更复杂的命令，可以为data-edit再添加一个参数；或者将链接用输入框（input标签）替代，并给输入框设置相应的data-edit命令（输入框中的数据将作为命令参数）。对于文件输入框，文件的内容将使用FileReader API来读取，读取到的数据作为命令执行结果。<p>
<pre class="prettyprint linenums">
&lt;a data-edit="fontName Arial"&gt;...&lt;/a&gt;
...
&lt;input type="text" data-edit="createLink"/&gt;
...
&lt;input type="file" data-edit="insertImage" /&gt;
</pre>
<p>用标准的jQuery方法就可以设置、获取编辑器的内容或者为其设置焦点。此外，还可以获取清除HTML标签后的内容：</p>
<pre class="prettyprint linenums">
 $('#editor').cleanHtml()
</pre>

			 <p style="text-align:center;">
				<a class="btn btn-large btn-primary jumbo" href="https://github.com/mindmup/bootstrap-wysiwyg/">View project on Github</a>
      </p>
			 <p style="text-align:center; margin-top:20px">
        <a class="btn" href="mailto:contact@mindmup.com"><i class="icon-envelope"></i></a>
          <a class="btn" href="http://facebook.com/mindmupapp"><i class="icon-facebook"></i></a>
          <a class="btn" href="http://twitter.com/mindmup"><i class="icon-twitter"></i></a>
          <a class="btn" href="https://plus.google.com/u/0/communities/112831595986131146219"><i class="icon-google-plus"></i></a>
        </p>

          
		</div>
	</div>
  <p>Bootstray-WYSIWYG由<a href="http://www.bootcss.com/">Bootstrap中文网</a>翻译整理</p>
</div>

<script src="http://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
<script src="https://mindmup.s3.amazonaws.com/lib/jquery.hotkeys.js"></script>
<script src="http://cdn.bootcss.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
<script src="bootstrap-wysiwyg.js"></script>
<script>
  $(function(){
    function initToolbarBootstrapBindings() {
      var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
            'Times New Roman', 'Verdana'],
            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
      $.each(fonts, function (idx, fontName) {
          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
      });
      $('a[title]').tooltip({container:'body'});
    	$('.dropdown-menu input').click(function() {return false;})
		    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
        .keydown('esc', function () {this.value='';$(this).change();});

      $('[data-role=magic-overlay]').each(function () { 
        var overlay = $(this), target = $(overlay.data('target')); 
        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
      });
      $('#voiceBtn').hide();
      // if ("onwebkitspeechchange"  in document.createElement("input")) {
      //   var editorOffset = $('#editor').offset();
      //   $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
      // } else {
      //   $('#voiceBtn').hide();
      // }
    };
    initToolbarBootstrapBindings();  
    $('#editor').wysiwyg();
    window.prettyPrint && prettyPrint();
  });
</script>
<a href="https://github.com/mindmup/bootstrap-wysiwyg/"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_gray_6d6d6d.png" alt="Fork me on GitHub"></a>
<div id="fb-root"></div>
<script src="/p/projects.js"></script>
</body>
</html>
