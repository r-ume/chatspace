class MessagesDecorator < Draper::Decorator

  def user_name
    object.user.name
  end

  def created_at
    object.created_at.strftime("%Y年%m月%d日 %H時%M分")
  end

  def body
    object.body
  end

  def image
    object.image
  end
end
