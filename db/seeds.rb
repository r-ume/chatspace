Message.delete_all
Message.create(id: 1, user_id: 1, chat_group_id: 1, body: 'Hello World!');
Message.create(id: 2, user_id: 2, chat_group_id: 1, body: '返信テスト');
Message.create(id: 3, user_id: 3, chat_group_id: 1, body: '3人目');
Message.create(id: 4, user_id: 1, chat_group_id: 1, body: 'もう一度テスト');