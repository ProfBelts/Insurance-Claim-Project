Rails.application.config.after_initialize do
    ActiveStorage::Current.url_options = {
      host: 'http://localhost:3000' # Update this for production
    }
  end
  
  # config/initializers/active_storage.rb
Rails.application.config.active_storage.analyzers.delete ActiveStorage::Analyzer::ImageAnalyzer::Vips
