class Room < ActiveRecord::Base
  mount_uploader :asset, AssetUploader
  validates :asset, presence: true

  def filename
    asset.file.path
  end
end
