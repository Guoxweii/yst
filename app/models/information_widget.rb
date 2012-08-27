class InformationWidget < Bubble::Widget
  self.unique!
  
  before_validation :assgin_position
  
  def assgin_position
    self.position = "information"
  end
  
  def summary(*args)
    "#{stack.try(:name)}#{group.try(:name)}"
  end

end