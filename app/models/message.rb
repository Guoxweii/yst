class Message < BaseEntry
  mount_uploader :poster, NoticeUploader
  auto_page_attrs :title, :content, :released_at, :expired_at, :poster
  attr_accessible :poster_cache, :remove_poster
end