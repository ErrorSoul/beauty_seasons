# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  name       :string
#  asset      :string
#  current_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Report < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  mount_uploader :asset, AssetUploader

  validates :name, presence: true

  def filename
    asset.file.path
  end
end
