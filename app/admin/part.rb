ActiveAdmin.register Part do
  config.per_page = 10

permit_params :id, :asset, :name, :content, :link, :mini_asset, :block_id
index do
  selectable_column
  id_column
  column t(:name), :name do |obj|
    obj.name
  end
  column  t(:asset), :asset do |obj|
    image_tag(obj.asset.url, size: '300x200')
  end

  column t(:block), :block_id do |obj|
    obj.block.name
  end


  column t(:content), :content do |obj|
    obj.content.mb_chars.truncate(70).html_safe
  end
  actions
end

show do
    attributes_table do
      row t(:mini_asset) do |obj|
        image_tag(obj.mini_asset.url, size: '300x200')
      end
      row t(:asset) do |obj|
        image_tag(obj.asset.url, size: '300x200')
      end
      row t(:content) do |obj|
        obj.content.mb_chars.truncate(70).html_safe
      end
      row t(:name) do |obj|
        obj.name
      end
      row t(:block) do |obj|
        obj.block.name
      end
      row t(:link) do |obj|
        obj.link.url
      end
    end
  end

  form(html: { multipart: true }) do |f|
   f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :block_id, label: t(:block), as: :select, collection: Block.all.map{|u| [u.name, u.id]}
      f.input :name, label: t(:title)
      f.input :asset
      f.input :mini_asset
      f.input :link
      f.input :content, as: :html_editor
    end
    f.actions
  end


end
