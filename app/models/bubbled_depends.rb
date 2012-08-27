Dir.glob(File.expand_path('../**/*.rb', __FILE__)).each do |path|
  require_dependency path
end