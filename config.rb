###
# Compass
###
compass_config do |config|
  config.output_style = :compact
  config.add_import_path "bower_components/foundation/scss"
  config.output_style = :compact

  after_configuration do
    @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
    sprockets.append_path File.join "#{root}", @bower_config["directory"]
  end

end

activate :directory_indexes

activate :blog do |blog|
  # blog.prefix = "blog"
  blog.permalink = "{year}/{month}/{title}.html"
  blog.sources = "blog/:year-:month-:day-:title.html"
  blog.layout = "blog"
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end


set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'


# Build-specific configuration
configure :build do
end
