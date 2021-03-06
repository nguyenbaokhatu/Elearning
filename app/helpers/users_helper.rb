# frozen_string_literal: true
# Description/Explanation of UsersHelper module

module UsersHelper
  def user_avatar(user, classes)
    @avatar = user.avatar
    if @avatar.present?
      @avatar_user = image_tag(@avatar.url, alt: user.fullname, class: classes)
    else
      @avatar_user = image_tag("/avatar.jpg", alt: user.fullname, class: classes)
    end
  end
end
