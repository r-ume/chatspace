//まだまだまだまだjQueryを書くのが慣れないので、chatspaceが完成するまで、コメントを残しておく。
$(function(){
    function buildHTML(data){
        var created_at = new Date(data.time);
        var y = created_at.getFullYear();
        var m = created_at.getMonth() + 1;
        var d = created_at.getDate();
        var h = created_at.getHours();
        var mi = created_at.getMinutes();
        var created_at_format = ' ' + y + '年' + m + '月' + d + '日' + h + '時' + mi + '分';
        var sent_by_who = ' ' + 'sent by' + ' '+ data.name;
        var image = '<img src =' + data.image + '>';
        if(data.image){
            var html = $('<li class = "messages">').append(data.body, sent_by_who, created_at_format, image);
        } else{
            var html = $('<li class = "messages">').append(data.body, sent_by_who, created_at_format);
        }
        return html;
    }

    $('.js-form-message').on('submit', function(e){
        e.preventDefault();
        //まずは、js-form__text-fieldのエリア指定
        var textField = $('.js-form__text-field');
        //まずは、form__image__fieldのエリア指定
        var imageField = $('.form_image_field');

        // jsonのurl指定
        // window.location.hrefは、現在のページのurlを取得するもの
        var jsonUrl = window.location.href;

        //　フォーム送信（メッセージを送信する場合は)、formDataクラスの初期化が必要。
        // 今までは、本文と画像のそれぞれを送信しようとしていたが、それでは、画像を送信するときに、file apiを使わないといけないので、
        // フォームをまとめて、送信するように設定する。
        // http://ginpen.com/2013/05/07/jquery-ajax-form/
        var message = new FormData($(this).get(0));

        //ここからが大事
        $.ajax({
            //　新しく作るので、post
            type: 'POST',
            // urlは、上で定義したもの
            // 上のPOSTやGETで動くurlを指定する -> ここはよーく復習
            url: jsonUrl,
            data: message,
            dataType: 'json',
            processData: false,
            contentType: false
        })
            .done(function(data){
                var html = buildHTML(data);
                $('.chat__messages').append(html);
                //　本文を送信したあと、textFieldに本文が残っているので、textfieldを空にする。
                textField.val('');
                // 画像を送信したあと、textFieldに画像が残っているので、imageFieldを空にする。
                imageField.val('');
            })
            .fail(function(){
                alert('error');
            });
    });
});