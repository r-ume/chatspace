//まだまだまだまだjQueryを書くのが慣れないので、chatspaceが完成するまで、コメントを残しておく。
$(function(){
    function buildHTML(message){
        var created_at = new Date(message.created_at);
        var y = created_at.getFullYear();
        var m = created_at.getMonth() + 1;
        var d = created_at.getDate();
        var h = created_at.getHours();
        var mi = created_at.getMinutes();
        var created_at_format = ' ' + y + '年' + m + '月' + d + '日' + h + '時' + mi + '分';
        var sent_by_who = ' ' + 'sent by' + ' '+ message.user_name;
        var image = '"<img src ="' + message.image_url + '">';
        console.log(image);

        var html = $('<li class = "messages">').append(message.body, sent_by_who, created_at_format, image);
        console.log(html);
        return html;
    }

    $('.js-form-message').on('submit', function(e){
        e.preventDefault();
        //まずは、js-form__text-fieldのエリア指定
        var textField = $('.js-form__text-field');
        // その中身を取得
        // var message = textField.val();

        // jsonのurl指定
        // window.location.hrefは、現在のページのurlを取得するもの
        var jsonUrl = window.location.href;

        //　フォーム送信（メッセージを送信する場合は)、formDataクラスの初期化が必要。
        // http://ginpen.com/2013/05/07/jquery-ajax-form/
        var message = new FormData($(this).get(0));
        // var $form = $(this);
        // var message = new FormData(document.forms.namedItem("the-form"));

        //ここからが大事
        $.ajax({
            //　新しく作るので、post
            type: 'POST',
            // urlは、上で定義したもの
            // 上のpostやgetで動くurlを指定する
            url: jsonUrl,
            // ここの書き方重要　よーく復習
            data: message,
            // data: {
            //     message: {
            //         user_name: message,
            //         body: message,
            //         created_at: message,
            //         image_url: message
            //     }
            // },
            dataType: 'json',
            processData: false,
            contentType: false
        })
            .done(function(json){
                var html = buildHTML(json);
                $('.messages_list').append(html);
                textField.val('');
            })
            .fail(function(){
                alert('error');
            });
    });
});