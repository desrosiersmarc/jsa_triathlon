module ApplicationHelper

  def helper_picture_cloudinary_path(cloudinary_path)
    cl_image_path(cloudinary_path, :quality=>50)
  end

  def helper_image_path(element)
    if element.photo?
      cl_image_path(element.photo, quality:"auto:low")
    else
      image_path('https://res.cloudinary.com/dmbf8fog4/image/upload/q_auto:low/c_scale,q_10,w_407/v1541453183/JSA%20Triathlon/calendrier_agenda.jpg')
    end
  end

  def helper_image_tag(element)
    if element.photo?
      cl_image_tag(element.photo, quality:"auto:low")
    else
      image_path('https://picsum.photos/200/300/?gravity=east')
    end
  end

  def helper_user_picture(user)
    if user.photo?
      cl_image_path(user.photo, :gravity=>"face", :crop=>"thumb", quality:"auto:low")
    else
      image_path("https://res.cloudinary.com/dmbf8fog4/image/upload/q_auto:low/v1559075961/JSA%20Triathlon/inconnu.jpg")
    end
  end

  def member?
    if user_signed_in?
      if current_user.role == 'admin' || current_user.member
        return true
      else
        return false
      end
    end
  end

  def admin?
    if user_signed_in?
      if current_user.role == 'admin'
        return true
      end
    end
  end
  def helper_list_contests(date)
    @list_articles = Article.where("date = ?",  Date.strptime(date, '%Y-%m-%d') )
                            .where(article_type: 3)
                            .where(active: true)
  end

  def helper_list_participants(article)
    article.participations
  end

  def helper_count_notifications
    @count_notifications = Notification.where(user_id: current_user.id).where(read: false).count
  end

  def name_to_display(id)
    firstname = User.find(id).firstname.downcase.capitalize
    lastname = User.find(id).lastname[0].downcase.capitalize + "."

    firstname + " " + lastname
  end

end
