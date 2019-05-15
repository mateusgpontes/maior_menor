#Envia uma informação
puts "Bem vindo ao jogo da adivinhação"
puts "Qual seu nome?"

#Pega uma informação/variável
nome = gets

#Pula 2 linha
puts "\n\n"

#Informa que irá começar o jogo
puts "Que comecem os jogos, #{nome}" 
puts "Escolha um numero de 0 a 200..."
puts "\n"
 
#Escolhe o número
secret_number = 165
tentativas = 0

puts "Adivinhe o número secreto."
puts "\n\n"

for tentativa in 1..3
    puts "Tentatica #{tentativa} de 3"
    puts "Coloque seu numero"

    chute = gets
    #Verifica número

    verifica = chute.to_i == secret_number
    maior = chute.to_i > secret_number

    if verifica
        puts "Você Acertou!"
    elsif maior
        puts "Você Errou! seu chute foi #{chute} o número secreto é menor"
    else
        puts "Você Errou! seu chute foi #{chute} o número secreto é maior"
    end

    puts "\n\n"
end