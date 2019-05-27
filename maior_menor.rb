require "pry"
require "pry-nav"

def da_boas_vindas
    #Envia uma informação
    puts "Bem vindo ao jogo da adivinhação"
    puts "Qual seu nome?"

    #Pega uma informação/variável
    nome = gets.strip

    #Pula 2 linha
    puts "\n\n"

    #Informa que irá começar o jogo
    puts "Que comecem os jogos, #{nome}" 
    return nome
end

def escolhe_numero
    puts "Escolha um numero de 0 a 200..."
    puts "\n"
    puts "Adivinhe o número secreto."
    puts "\n\n"
    #return
    number = 165
end

def pega_um_numero (chute_anterior, tentativa_atual, tentativas_total)
    puts "Tentativa #{tentativa_atual} de #{tentativas_total}"
    puts "Seus chutes --> #{chute_anterior}" 
    puts "Coloque seu numero"
    chute_number = gets.strip
    chute_number.to_i
end

def verifica_se_acertou (number, chute_number, tentativa_atual, tentativa_total, pontos)
    verifica = chute_number == number
    maior = chute_number > number
    menor = chute_number < number

    if verifica
        puts "\n"
        puts "Parabens! Você Acertou! seu chute foi #{chute_number}"
        puts "\n"
        puts "Você ganhou #{pontos} pontos."
        puts "\n\n"
        return true
    elsif maior
        puts "\n"
        puts "Você Errou! seu chute foi #{chute_number} o número secreto é menor"
        puts "\n"        
        puts "Seus pontos atuais são #{pontos}"
        puts "\n\n"
        return false
    elsif menor
        puts "\n"
        puts "Você Errou! seu chute foi #{chute_number} o número secreto é maior"
        puts "\n"        
        puts "Seus pontos atuais são #{pontos}"
        puts "\n\n"
        return false
    elsif  tentativa_atual == tentativa_total
        puts "\n"
        puts "Você Perdeu! não tem mais tentativas o numero secreto era #{number}"
        puts "\n"        
        puts "Seus pontos atuais são #{pontos}"
        puts "\n\n"
        return false
    end

    puts "\n\n"
end

nome = da_boas_vindas
secret_number = escolhe_numero
tentativas = 5
chutes = []
pontos = 1000
puts "Você tem #{pontos}"
puts "\n\n"

for tentativa in 1..tentativas
    chute = pega_um_numero(chutes, tentativa, tentativas)
    chutes << chute
    #total_chutes += 1

    pontos_a_perder = (chute - secret_number).abs/2.0
    pontos -= pontos_a_perder
    if verifica_se_acertou(secret_number, chute, tentativa, tentativas, pontos)
        break
    end
end
