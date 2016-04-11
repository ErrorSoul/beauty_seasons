namespace :db do

  desc 'fill rooms'
  task make_rooms: :environment do
    LAYOUTS_PATH = 'public/interier'
    files = Dir.entries(LAYOUTS_PATH) - %w(. .. .DS_Store)
    Room.transaction do
      files.each do |filename|
        f = File.open(LAYOUTS_PATH + '/' + filename)
        Room.create!(
          asset: f
        )
      end
    end
  end

  desc 'fill blocks'
  task create_blocks: :environment do
    arr = [
      ['BEAUTY CLUB', 'beauty'],
      ['КОСМЕТОЛОГИЯ', 'cosmetology'],
      ['BOUTIQUE', 'boutique']
    ]
    Block.transaction do
      arr.each do |a|
        Block.create!(name: a.first, code: a.last)
      end
    end
  end
end
