# Crear una clase Course cuyo constructor reciba el nombre y las fechas de inicio
# y termino de cada curso.

# Crear un metodo que permita leer el archivo e instanciar una mesa por linea del archivo.

# Crear metodos que permitan:

# Saber que cursos comienzan previo a una fecha entregada como argumento.
# Saber que cursos finalizan posterior a una fecha entregada como argumento.
# En ambos el metodos argumento por defecto debe ser la fecha de hoy.
# Ambos metodos deben levantar una excepcion si la fecha recibida es >= 2018-01-01

require 'date'
class Course
  attr_accessor :dates, :name
  def initialize(name, *dates)
    @name = name
    @dates = dates.map { |date| Date.parse(date) }
  end

  def begin(date_filter)
  #  raise ArgumentError.new('date limit') if date_filter >= 2018-01-01
      @name if @dates[0] < date_filter
  end

  def after(filter_date)
    #raise ArgumentError.new('date limit') if filter_date >= 2018-01-01
        @name if @dates[1] > filter_date
  end

  def to_s
    " #{@name}"
  end

end
file = File.open('cursos.txt', 'r')
data = file.readlines
file.close

courses = []
data.each do |line|
  ls = line.split(', ')
  courses << Course.new(*ls)
end
puts "cursos que comienzan antes de #{Date.today} son: "
courses.each do |course|
  print " #{course.begin(Date.today)}"
end
puts
puts
puts "cursos que finalizan despues de #{Date.today} son: "
courses.each do |course|
  print " #{course.after(Date.today)}"
end
