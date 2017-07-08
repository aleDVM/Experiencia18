# Se tiene un array que contiene los numeros de una ruleta.

# Crear una clase llamada Roulette.

# Crear un metodo de instancia llamado play que reciba como argumento un numero
# al cual se esta apostando. Luego debe tomar un valor -del array- al azar y
# compararlo con el numero al cual se aposto.

# Crear un metodo de instancia que:

# Debe almacenar el numero generado al azar en un archivo llamado
# roulette_history.txt

# Si el numero al cual se aposto corresponde al generado al azar entonces,
# debe ademas almacenar ese numero en un archivo llamado winners.txt

# Crear un metodo que lea el archivo rouletter_history.txt y retorne el valor
# que mas ha generado la ruleta historicamente.

class Roulette
  attr_accessor :num
  def initialize(*num)
    @num = num

  end
  def play(num)
    @num.sample
  end

  def to_s
    "#{@num}"
  end
  def self.write_data
    r = (1..10).to_a
    file = File.open('roulette_history.txt', 'w')
    file.puts r.sample
    file.close
  end
  def self.load_data
    file = File.open('roulette_history.txt', 'r')
    data = file.read
    file.close
    return data
  end
end
r = (1..10).to_a
roe = Roulette.new(*r)
Roulette.write_data
a = roe.play(r)
puts "el numero apostado es #{a}"
data = Roulette.load_data
puts "el numero ganador es : #{data}"
if a.to_i == data.to_i
  file = File.open('winners.txt', 'a')
  file.puts a
  puts 'You had won'
  file.close
end
