module Validation
  def check_params params
    weight = check_input('weight', params[:weight], 500)
    height = check_input('height', params[:height], 5)

    if weight[:success] && height[:success]
      { success: true, message: 'ok' }
    else
      { success: false, message: join_msg(weight, height) }
    end
  end

  private
  
  def check_input(name, value, limit)
    if !is_number? value
      {  success: false, message: "#{name} must be a number." }
    elsif is_negative? value 
      { success: false, message: "#{name} must be greater than 0." }
    elsif greater_than?(value, limit)
      { success: false, message: "#{name} must be less than #{limit}." }
    else
      { success: true, message: '' }
    end
  end

  def is_number? value
    value.is_a? Numeric
  end

  def is_negative? value 
    value <= 0
  end

  def greater_than?(value, limit)
    value >= limit
  end

  def join_msg(weight, height)
    [ weight[:message], height[:message] ].join("\n")
  end
end
