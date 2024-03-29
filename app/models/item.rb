class Item < ApplicationRecord
 has_one_attached :image
 has_many :cart_items, dependent: :destroy
 belongs_to :genre
 has_many :order_details, dependent: :destroy
 def with_tax_price
     (price * 1.1).floor
 end

def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path),filename: 'defalt-image.jpg', content_type: 'image/jpeg')
  end
  image.variant(resize_to_limit: [width, height]).processed
end

end
