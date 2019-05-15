
def da_boas_vindas
    #Envia uma informação
    puts "Bem vindo ao jogo da adivinhação"
    puts "Qual seu nome?"

    #Pega uma informação/variável
    nome = gets 

    #Pula 2 linha
    puts "\n\n"

    #Informa que irá começar o jogo
    puts "Que comecem os jogos, #{nome}" 
end

def escolhe_numero
    puts "Escolha um numero de 0 a 200..."
    puts "\n"
    puts "Adivinhe o número secreto."
    puts "\n\n"
    #return
    number = 165   
end

def pega_um_numero (tentativa_atual, tentativas_total)
    puts "Tentativa #{tentativa_atual} de #{tentativas_total}"
    puts "Coloque seu numero"
    chute_number = gets
    chute_number.to_i
end

def verifica_se_acertou (number, chute_number)
    verifica = chute_number == number
    maior = chute_number > number

    if verifica
        puts "Parabens! Você Acertou! seu chute foi #{chute_number} e o numero secreto era #{number}"
        return true
    elsif maior
        puts "Você Errou! seu chute foi #{chute_number} o número secreto é menor"
        return false
    elsif
        puts "Você Errou! seu chute foi #{chute_number} o número secreto é maior"
        return false
    end

    puts "\n\n"
end

da_boas_vindas
secret_number = escolhe_numero

tentativas = 5

for tentativa in 1..tentativas
    
    chute = pega_um_numero(tentativa, tentativas)
    if verifica_se_acertou(secret_number, chute)
        break
    end
end