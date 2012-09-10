class BaseEntry < Bubble::Entry
  # self.table_name = "bubble_entries"
  # self.abstract_class = true
  before_save :revise_status
  self.unimplemented!

  symbolize :status, :in => [:pending, :online, :reject], :scopes => true, :allow_blank => true
  attr_accessible :alert

  def revise_status
    if self.status_was == :reject
      self.status = :pending
    end
  end

  def self.column_defaults
    super.tap do |result|
      result["status"] = :pending
    end
  end

end

require_dependency "bubbled_depends"