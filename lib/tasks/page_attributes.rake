namespace :page_attributes do
  desc "Create attributes list"
  task create_list: :environment do
    %w[title desc published author seo].each do |name|
      Attribute.find_or_create_by name: name
    end
  end
end
