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
  
  def educational_status(student)
    [(student.educational_program.name if student.educational_program.name), 
     ("#{student.stage} курс" if student.stage), 
     ("#{student.group} группа" if student.group)].join(", ")
  end
  
end