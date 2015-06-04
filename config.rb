###
# Compass
###
compass_config do |config|
  config.output_style = :compact
end



activate :blog do |blog|
  # blog.prefix = "blog"
  blog.permalink = "{year}/{month}/{title}.html"
  blog.sources = "blog/:year-:month-:day-:title.html"
  blog.layout = "blog"

  blog.calendar_template = "calendar.html"
  blog.tag_template = "tag.html"
end

activate :directory_indexes


activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end


set :css_dir, 'stylesheets'

set :js_dir, 'js'

set :images_dir, 'images'


# Build-specific configuration
configure :build do
  compass_config do |config|
    config.output_style = :compressed
  end

  activate :minify_javascript

  # Ensure links work even if we're not at the base url
  activate :relative_assets

  set :relative_links, true

end
