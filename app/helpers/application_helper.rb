module ApplicationHelper

  def helper_picture_cloudinary_path(cloudinary_path)
    cl_image_path(cloudinary_path, :quality=>50)
  end
end
