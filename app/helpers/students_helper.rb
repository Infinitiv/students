module StudentsHelper
  def sex_sign(string)
    case string
    when 'мужской'
      '&#x2642;'
    when 'женский'
      '&#x2640;'
    else
      ''
    end
  end
end