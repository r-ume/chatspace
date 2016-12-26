//まだまだまだまだjQueryを書くのが慣れないので、chatspaceが完成するまで、コメントを残しておく。
$(function(){
    function new_message(data) {
        var new_message =
            "<li class = 'chat-message'>" +
            "<div class = 'chat-message__header clearfix'>" +
            "<p class = 'chat-message__name'>" + data.user + "</p>" +
            "<p class = 'chat-message__time'>" + data.time + "</p>" + "</div>" +
            "<p class = 'chat-message__body'>" + data.body + "</p>";

        if(data.image){
            new_message += "<img class = 'chat-message__image' src='" + data.image + "'></li>";
        } else{
            new_message += "</li>";
        }
        return new_message;
        // $('.chat-messages').append(new_message);
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
                var html = new_message(data);
                $('.chat__messages').append(html);
                //　本文を送信したあと、textFieldに本文が残っているので、textfieldを空にする。
                textField.val('');
                // 画像を送信したあと、textFieldに画像が残っているので、imageFieldを空にする。
                imageField.val('');
                scrollToBottom();

            })
            .fail(function(){
                alert('error');
            });
    });


    scrollToBottom();

    // 自動スクロール
    function scrollToBottom() {
        $('.chat-body').scrollTop( $('.chat-messages').height() );
    }

    // 自動更新のために、メッセージのAPIのURLを取得
    var jsonUrlForAutoReload = window.location.href;

    // 自動更新用のURLにchat_groupsとmessageが含まれているかをチェック
    function isJsonUrlForAutoReload(url){
       if (url.indexOf(/\/chat_groups\/d+\/messages/)){
           console.log('true');
           return true;
       } else {
           console.log('false');
           return false;
       }
    }

    // もし、chat_groups/:group_id/messagesのurlだったら、（メッセージ画面だったら、)、自動更新を行う
    if(isJsonUrlForAutoReload(jsonUrlForAutoReload)){
        setInterval(function(){
           $.ajax({
               method: 'GET',
               url: jsonUrlForAutoReload,
               dataType: 'json'
           })
               .done(function(data){
                   var html = '';
                   // forEach関数で、配列を一つ一つ処理
                   data.forEach(function(message_new){
                       html = new_message(message_new);
                   });
                   // html関数は、指定した要素を書き換える removeとappendを一緒にする関数
                   $('ul.chat-messages').html(html);
               })
               .fail(function(){
                   alert('自動更新失敗');
               })
        //    10秒ごとに自動更新
        }, 10 * 1000);
    }
});

