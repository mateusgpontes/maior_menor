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

def pede_dificuldade
    puts "Qual o nivel de difículdade que deseja? (Escolha pelo número da Difículdade. ex:1)"
    puts "\n"
    puts "1 Fácil, escolhe um número de 0 a 30"
    puts "\n"
    puts "2 Médio, escolhe um número de 0 a 60"
    puts "\n"
    puts "3 Difícil, escolhe um número de 0 a 100"
    puts "\n"
    puts "4 Expert, escolhe um número de 0 a 150"
    puts "\n"
    puts "5 Profissional, escolhe um número de 0 a 200"
    puts "\n"
    dificuldade = gets.to_i
    case dificuldade
    when 1
        dificuldade = "Fácil"
    when 2
        dificuldade = "Médio"
    when 3
        dificuldade = "Difícil"  
    when 4
        dificuldade = "Expert"        
    when 5
        dificuldade = "Profissional"        
    else 
        pede_dificuldade
    end               
end

def escolhe_numero(dificuldade)
    case dificuldade 
    when "Fácil"
        maximo = 30
    when "Médio"
        maximo = 60
    when "Difícil"
        maximo = 100
    when "Expert"
        maximo = 150
    when "Profissional"
        maximo = 200    
    end
    puts "Escolha um numero de 1 a #{maximo}"
    puts "\n"
    puts "Adivinhe o número secreto."
    puts "\n\n"
    #return
    number = rand(maximo) + 1
end

def pega_um_numero (chute_anterior, tentativa_atual, tentativas_total)
    puts "Tentativa #{tentativa_atual} de #{tentativas_total}"
    puts "Seus chutes --> #{chute_anterior}" 
    puts "Coloque seu numero"
    chute_number = gets.strip
    chute_number.to_i
end

def verifica_se_acertou? (number, chute_number, tentativa_atual, tentativa_total, pontos)
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

def jogar (nome, dif)
    secret_number = escolhe_numero(dif)
    tentativas = 5
    chutes = []
    pontos = 1000
    puts "Você tem #{pontos} Pontos"
    puts "\n\n"

    for tentativa in 1..tentativas
        chute = pega_um_numero(chutes, tentativa, tentativas)
        chutes << chute
        #total_chutes += 1

        if nome == "Notirus"
            puts "\n"
            puts "Parabens! Você Acertou! seu chute foi #{secret_number}"
            puts "\n"
            puts "Você ganhou #{pontos} pontos."
            puts "\n\n"
            break
        end

        pontos_a_perder = (chute - secret_number).abs/2.0
        pontos -= pontos_a_perder
        if verifica_se_acertou?(secret_number, chute, tentativa, tentativas, pontos)
            break
        end
    end

    puts "o numero secreto era #{secret_number}"
    puts "\n"
end

def jogar_novamente?
    puts "Jogar Novamente? (S/N)"
    quero_jogar = gets.strip
    case quero_jogar.upcase
    when "S"
        quero_jogar = true
    else
        quero_jogar = false
    end    
end

nome = da_boas_vindas
dif = pede_dificuldade


loop do
    jogar(nome, dif)
    if !jogar_novamente?
        break
    end
end