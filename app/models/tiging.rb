class Tiging < ActiveRecord::Base

  mount_uploader :asset, AssetUploader
  validates :title, :text, :asset, presence: true
end
