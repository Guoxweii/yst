class Notice < Bubble::Entry
  auto_page_attrs :title, :released_at, :expired_at, :content
end