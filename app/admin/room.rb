ActiveAdmin.register Room do
  config.per_page = 10

permit_params :id, :asset

index do
  selectable_column
  id_column
  column  t(:asset), :asset do |obj|
    image_tag(obj.asset.url, size: '300x200')
  end
  actions
end

show do
    attributes_table do
      row t(:asset) do |obj|
        image_tag(obj.asset.url, size: '300x200')
      end
    end
  end


end
