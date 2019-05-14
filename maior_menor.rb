#Envia uma informação
puts "Bem vindo ao jogo da adivinhação"
puts "Qual seu nome?"

#Pega uma informação/variável
nome = gets

#Pula 2 linha
puts 
puts 

#Informa que irá começar o jogo
puts "Que comecem os jogos, #{nome}" 
puts "Escolha um numero de 0 a 200..."

#Escolhe o número
secret_number = 165
puts "Escolhido... Adivinhe o número secreto."
puts 
puts "Primeira Tentativa"
puts "Coloque seu numero"
chute = gets
puts
puts "Acertou? Você chutou #{chute}"
puts chute.to_i == secret_number
