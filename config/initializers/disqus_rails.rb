DisqusRails.setup do |config|
  config::SHORT_NAME = "sociedad_actua"
  config::PUBLIC_KEY = 'ashduUPJuJ50cls06GGAviCXflbyjJHgdkLlfGKKdlazxocneruCzy5Nj0utyYOoYs'

  if Rails.env.production?
    config::SHORT_NAME = ENV['DISQUS_SHORT_NAME']
    config::PUBLIC_KEY = ENV['DISQUS_PUBLIC_KEY']
    config::ACCESS_TOKEN = ENV['DISQUS_TOKEN']
  end
end