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

        var html = $('<li class = "messages">').append(message.body, created_at_format);
        return html;
    }


    $('.js-form').on('submit', function(e){
        e.preventDefault();
        //まずは、js-form__text-fieldのエリア指定
        var textField = $('.js-form__text-field');
        // その中身を取得
        var message = textField.val();
        // jsonのurl指定
        // window.location.hrefは、現在のページのurlを取得するもの
        var jsonUrl = window.location.href + '.json';

        // ここからが大事
        $.ajax({
            //　新しく作るので、post
            type: 'POST',
            // urlは、上で定義したもの
            url: jsonUrl,
            // ここの書き方重要　よーく復習
            data: {
                message: {
                    body: message,
                    created_at: message
                }
            },
            dataType: 'json'
        })
        .done(function(data){
            var html = buildHTML(data);
            $('.messages_list').append(html);
            textField.val('');
        })
        .fail(function(){
            alert('error');
        })
    });

});