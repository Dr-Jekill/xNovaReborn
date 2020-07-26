function submitftp()
{
	$.get('?mode=ajax&action=ftp&lang='+location.search.split('&')[1].substr('-2')+'&'+$('#ftp').serialize(), function(data) {
		if(data == "")
			document.location.reload();
		else
			Dialog.alert(data);
	});
}

function submitinstall()
{
	$.getJSON('?mode=ajax&action=install&'+$('#install').serialize(), function(data) {
		console.log(data);
		if(!data.error)
			document.location.href = '?mode=ins&page=2&lang='+location.search.split('&')[2].substr('-2');
	});
	return false;
}

function submitupdate()
{
	$.getJSON('?mode=ajax&action=update&'+$('#update').serialize(), function(data) {
		console.log(data);
		if(!data.error)
			document.location.href = '?mode=upd&page=2&lang='+location.search.split('&')[2].substr('-2');
	});
	return false;
}