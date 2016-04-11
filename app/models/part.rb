class Part < ActiveRecord::Base
  validates :asset, :content, :mini_asset, :name, presence: true
  belongs_to :block

  mount_uploader :mini_asset, AssetUploader
  mount_uploader :asset, AssetUploader
  mount_uploader :link, AssetUploader
end
