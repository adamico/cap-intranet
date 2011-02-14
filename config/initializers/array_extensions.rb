class Array
  def without_self(object)
    reject {|item| item === object}
  end
end
