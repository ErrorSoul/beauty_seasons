ActiveAdmin.register Tiging do
  config.per_page = 10

permit_params :id, :asset, :title, :text

index do
  selectable_column
  id_column
  column  t(:asset), :asset do |obj|
    image_tag(obj.asset.url, size: '300x200')
  end
  column t(:title), :title do |obj|
    obj.title
  end

  column t(:text), :text do |obj|
    obj.text.mb_chars.truncate(70).html_safe
  end
  actions
end

show do
    attributes_table do
      row t(:asset) do |obj|
        image_tag(obj.asset.url, size: '300x200')
      end
      row t(:title) do |obj|
        obj.title
      end
      row t(:text) do |obj|
        obj.text.mb_chars.truncate(70).html_safe
      end
    end
  end

  form(html: { multipart: true }) do |f|
   f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title, label: t(:title)
      f.input :asset
      f.input :text, as: :html_editor
    end
    f.actions
  end


end
