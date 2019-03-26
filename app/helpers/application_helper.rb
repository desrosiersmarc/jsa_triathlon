module ApplicationHelper

  def helper_picture_cloudinary_path(cloudinary_path)
    cl_image_path(cloudinary_path, :quality=>50)
  end

  def helper_image_path(element)
    if element.photo?
      cl_image_path(element.photo)
    else
      image_path('https://res.cloudinary.com/dmbf8fog4/image/upload/v1541682380/JSA%20Triathlon/bbmygg5lpt0nyympgnxf.jpg')
    end
  end

  def helper_image_tag(element)
    if element.photo?
      cl_image_tag(element.photo)
    else
      image_path('https://picsum.photos/200/300/?gravity=east')
    end
  end

  def helper_user_picture(user)
    if user.photo?
      cl_image_path(user.photo, :gravity=>"face", :crop=>"thumb")
    else
      image_path('https://picsum.photos/200/300/?gravity=east')
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

end
