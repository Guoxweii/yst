class NewsWidget < Bubble::Widget
  self.unique!
  
  before_validation :assgin_position
  
  def assgin_position
    self.position = "news"
  end
  
  def summary(*args)
    "#{stack.try(:name)}#{group.try(:name)}"
  end

end