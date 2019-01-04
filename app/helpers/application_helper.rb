module ApplicationHelper

  def helper_picture_cloudinary_path(cloudinary_path)
    cl_image_path(cloudinary_path, :quality=>50)
  end

  def helper_image_path(element)
    if element.photo?
      cl_image_path(element.photo)
    else
      image_path('https://picsum.photos/200/300/?gravity=east')
    end
  end

  def helper_image_tag(element)
    if element.photo?
      cl_image_tag(element.photo)
    else
      image_path('https://picsum.photos/200/300/?gravity=east')
    end
  end

end
