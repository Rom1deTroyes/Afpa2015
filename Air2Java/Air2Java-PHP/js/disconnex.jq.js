/*
 * Air2Java
 * (c)2014 Rom1
 */
$(document).ready(function() {
    var loader = "./img/note.gif"; // $('#assets_directory').val() +
    var token = $('input[name=ci_csrf_token]').val();
    $('#connex-use-button').click(function(e) {
        e.preventDefault();
        $('#connex-use-response').html('').html('<img src="' + loader + '" alt="#" />&nbsp;Chargement...');
        $.ajax({
            url: window.location, // + '?c=connexion'
            type: 'POST',
            data: {
                ci_csrf_token: token,
                c: 'connexion',
                a: 'disconnect'
            },
            error: function(jqXHR, textStatus, errorThrown) {
                $('#connex-use-response').html('').html('<span class="error">Une erreur est survenue lors de la requÃªte.</span>');
            },
            success: function(data, textStatus, jqXHR) {
                alert('Disco/Ajax/Success : ' + data);
                $('#connexion').html('').html(data);
            }
        });
    });
    $('#connex-deco-button').click(function(e) {
        e.preventDefault();
        $('#connex-use-response').html('').html('<img src="' + loader + '" alt="#" />&nbsp;Chargement...');
        var data = {
            ci_csrf_token: token,
            c: 'connexion',
            a: 'Disconnect'
        };
        $.get(window.location, data, function(data) {
            alert('Disco/GET : ' + data);
            $('#connexion').html('').html(data);
        });
    });
})();