# ProtoSpace

## Userモデル
  - email
  - encrypted_password
  - name

## Messageモデル
  - body
  - chat_group_id
  - user_id
  - image

## ChatGroupモデル
  - chat_group_id
  - user_id

## ChatGroupUserモデル
  - name

# Associations

- users has_many: :chat_group_users :chat_groups through: :chat_group_users, :messages 

- messages belong_to: :chat_group, :user

- chatgroups has_many: :chat_group_users, :users through: :chat_group_users, :messages

- chatgroupsusers belongs_to: :chat_group, :user

