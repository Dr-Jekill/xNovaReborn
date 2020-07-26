<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="es">
<head>
<link rel="stylesheet" type="text/css" href="./styles/theme/gultra/cpanel.css" />
<link rel="icon" href="./favicon.ico">
<title>{$title}</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="content-script-type" content="text/javascript">
<meta http-equiv="content-style-type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=100">
<link rel="shortcut icon" href="./favicon.ico" type="image/x-icon">
{if $goto}
<meta http-equiv="refresh" content="{$gotoinsec};URL={$goto}">
{/if}
<script type="text/javascript" src="./scripts/jQuery.js"></script>
<script type="text/javascript" src="./scripts/base.js"></script>
<script type="text/javascript" src="./scripts/filterlist.js"></script>
{foreach item=scriptname from=$scripts}
<script type="text/javascript" src="./scripts/{$scriptname}.js"></script>
{/foreach}
<script type="text/javascript">
var xsize    = screen.width;
var ysize    = screen.height;
var breite   = 720;
var hoehe   = 300;
var xpos   = (xsize-breite) / 2;
var ypos   = (ysize-hoehe) / 2;
var head_info   = "{$fcm_info}";

function useropen(target_url) {
   var userlist = window.open("UserListPage.php?action=edit&id="+ target_url, "info", "scrollbars=yes,statusbar=no,toolbar=no,location=no,directories=no,resizable=no,menubar=no,width=850,height=600,screenX="+((xsize-600)/2)+",screenY="+((ysize-850)/2)+",top="+((ysize-600)/2)+",left="+((xsize-850)/2));
   userlist.focus();
}

function openEdit(id, type) {
   var editlist = window.open("?page=qeditor&edit="+type+"&id="+id, "edit", "scrollbars=yes,statusbar=no,toolbar=no,location=no,directories=no,resizable=no,menubar=no,width=850,height=600,screenX="+((xsize-600)/2)+",screenY="+((ysize-850)/2)+",top="+((ysize-600)/2)+",left="+((xsize-850)/2));
   editlist.focus();
}
</script>
<style type="text/css">
    html{
        height: 100%;
    }
</style>
</head>
<body>
<div id="tooltip" class="tip"></div>

<div id="content">
	<form action="" method="POST">
        <div class="form">
            <div class="form_header">
                Administracion
            </div>
            <div class="form_group">
                <label>{$adm_password}</label>
                <input type="password" name="admin_pw">
            </div>
            <button class="btn btn_blue btn_block" type="submit">{$adm_absenden}</button>
        </div>
	</form>
</div>
{if $smarty.get.reload == 't'}
<script type="text/javascript">
parent.topFrame.document.location.reload();
</script>
{elseif $smarty.get.reload == 'l'}
<script type="text/javascript">
parent.rightFrame.document.location.reload();
</script>
{/if}
</body>
</html>