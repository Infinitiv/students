# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
EducationalProgram.create(name: 'лечебное дело', level: 'специалитет', standart: 'ГОС-2')
EducationalProgram.create(name: 'педиатрия', level: 'специалитет', standart: 'ГОС-2')
EducationalProgram.create(name: 'лечебное дело', level: 'специалитет', standart: 'ФГОС-3')
EducationalProgram.create(name: 'педиатрия', level: 'специалитет', standart: 'ФГОС-3')
EducationalProgram.create(name: 'стоматология', level: 'специалитет', standart: 'ФГОС-3')
TargetOrganization.create(name: 'Департамент здравоохранения Владимирской области')
TargetOrganization.create(name: 'Департамент здравоохранения Ивановской области')
TargetOrganization.create(name: 'Департамент здравоохранения Костромской области')
TargetOrganization.create(name: 'Департамент здравоохранения Брянской области')
TargetOrganization.create(name: 'Департамент здравоохранения Тульской области')
TargetOrganization.create(name: 'Департамент здравоохранения Вологодской области')
TargetOrganization.create(name: 'Департамент здравоохранения Пензенской области')
TargetOrganization.create(name: 'Департамент здравоохранения Липецкой области')
TargetOrganization.create(name: 'ФМБА России')
Status.create(name: 'обучающийся')
Status.create(name: 'отчислен')
Status.create(name: 'академический отпуск')