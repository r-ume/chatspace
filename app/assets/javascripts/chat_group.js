//jQueryを書くのは、初めてなので、丁寧にコメントを入れていく。
// http://qiita.com/mpyw/items/62e6e415f86eb30a5ff4 - jQueryからPHPのAPIを利用する。

// shorthand for
// $(document).ready(function()(
// ));
$(function(){

    // ユーザー検索
    function searchUser() {
        $.ajax("/users.json", {
            //'users.json'の情報をゲット
            type: 'GET',
            //送信データを指定する
            //jsonのなかで、emailカラムを見ているってことか？（要勉強)
            //idがuser-search-fieldのinputから、取得
            data: {
                name: $('#user-search-field').val()
            },
            // jsonファイルなので、jsonを指定
            dataType: 'json'
        })
        //・ステータスコードは正常で、dataTypeで定義したようにパース出来たとき
        .done(function(json){
            var insertHtml = '';
            json.forEach(function(user){
                insertHtml += buildAddHtml(user);
            });
            $('#user-search-result').html(insertHtml);
        })
        // ・サーバからステータスコード400以上が返ってきたとき
        // ・ステータスコードは正常だが、dataTypeで定義したようにパース出来なかったとき
        // ・通信に失敗したとき
        .fail(function(){
            alert('something went wrong');
        });
    }

    // 結果をidがuser-search-fieldに出していく。
    $('#user-search-field').on('change keyup', searchUser);

    // チャットメンバーを追加
    $('#user-search-result').on('click', function(){
        var $this = $(this);
        var id = $this.data('userId');
        var name = $this.data('userName');

        var insertHTML = buildDeleteHTML(id, name);
        // フォームにユーザーを追加
        $('#chat-group-users').append(insertHTML);
    });

    // 今度、userのidをパスしなければならないので、htmlのタグを一気に入れるため、関数か
    function buildAddHtml(user) {
        var html =
            '<p>' +
            user.name +
            '</p>' +
            '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="'
                    + user.id + '" data-user-name="' + user.name + '">追加' +
            '</a>';
        return html;
    }

});


// ---------------------
