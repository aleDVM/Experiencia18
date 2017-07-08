# El archivo casino.txt contiene las recaudaciones de 4 dias de un casino
# separadas por mesa de juego.
# Crear una clase Table cuyo constructor reciba el nombre de la mesa y
# las recaudaciones correspondientes de cada dia.

# Crear un metodo que permita leer el archivo e instanciar una mesa
# por linea del archivo.

# Crear metodos que permitan:
# Conocer el mayor valor recaudado, y a que mesa y dia corresponde.
# Calcular el promedio total de lo recaudado por todas las mesas en todos
# los dias.

class Table

  attr_accessor :name, :collections

  def initialize(name, *collections)
    @name = name
    @collections = collections.map(&:to_i)
  end

  def greater_collection

    a = @collections.max

  end
  def day
      day = @collections.index(@collections.max) + 1
  end

    def average
      @collections.inject(&:+) / @collections.size.to_f
    end

    def self.load_data
      file = File.open('casino.txt', 'r')
      data = file.readlines
      file.close
      tables = []
      data.each do |line|
        ls = line.split(', ')
        tables << Table.new(*ls)
      end
        tables
    end
  end

prom = 0
tables = Table.load_data
tables.each do |table|
  print "El mayor valor recaudado de la #{table.name} es "
  print "#{table.greater_collection} el dia #{table.day}"
  prom += table.average / tables.size
  puts
end

puts "El promedio total de lo recaudado es #{prom}"
