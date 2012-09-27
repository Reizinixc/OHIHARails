module UserSessionsHelper

  def get_desc_pic_url
    image_url_list = ['eco_saga14_01', 'yakyuu_01']
    image_url = image_url_list[rand(image_url_list.length)]
    "bg-left/#{image_url}.jpg"
  end
end
