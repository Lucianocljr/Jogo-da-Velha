
tabuleiro = {{' ',' ',' '},{' ',' ',' '},{' ',' ',' '}}
require ("jogador")

pontBolinha = 0
pontXis = 0

function tabuleiro:NewTab()

	local outroTabuleiro = {}

	setmetatable (outroTabuleiro, {__index = tabuleiro})

	return outroTabuleiro
end

string = ""

function tabuleiro:ShowTab()

	for i = 1, #tabuleiro do

		if i == 2 or i == 3 then
		string = string .. "-----\n"
		end

			for j=1, #tabuleiro[i] do

				if(j <= 3 ) then
				string = string .. tabuleiro[i][j]

					if(j < 3 ) then
					string = string .."|"

					end

				end

				if(j == 3 ) then
				string = string .. "\n"
				end
			end
	end

string = string .. "\n"
print(string)

end

function tabuleiro:VerificaDigitacao(linha, coluna)

	if((linha == nil) or (coluna == nil))then
	return false
	end

	if(((linha == "1") or (linha == "2") or (linha == "3")) and ((coluna == "1") or (coluna == "2") or (coluna == "3"))) and (self[tonumber(linha)][tonumber(coluna)] == ' ')  then
	print("Valor da verificação da linha " .. linha)
	return true
	end

	return false
end

function tabuleiro:jogada(linha,coluna)

	if (self:VerificaDigitacao(linha,coluna)==true) then

	self[tonumber(linha)][tonumber(coluna)] = jogador

		if(jogador == 'X') then

		jogador = 'O'

		else

		jogador = 'X'

	end

	return true

	end

	return false
end

function tabuleiro:proximaJogada()
print("Vez do jogador " .. jogador)
	repeat
	print("Digite uma linha")
	l = io.read("*l")

	print("Digite uma coluna")
	c = io.read("*l")
		if (l ~= nil) and (c ~= nil) then

		teste = false

		end

	local realizada = tabuleiro:jogada(l,c)

	teste = realizada

	if teste then
	print("Jogada realizada com sucesso")

	else
	print("Tente novamente")
	end


	until(realizada)
end

function tabuleiro:VerificaVencedorHorizontal()
jogadorVenceu = ""

	if (tabuleiro[1][1] ~= ' ') and (tabuleiro[1][1] == tabuleiro[1][2]) and (tabuleiro[1][2] == tabuleiro[1][3]) then
	jogadorVenceu = tabuleiro[1][1]
	jogador = jogadorVenceu

		if(tabuleiro[1][1] == 'O') then
		pontBolinha = pontBolinha + 1
		end

		if(tabuleiro[1][1] == 'X') then
		pontXis = pontXis + 1
		end

	tabuleiro[1][1] = '-'
	tabuleiro[1][2] = '-'
	tabuleiro[1][3] = '-'

	return 3

	end

	if (tabuleiro[2][1] ~= ' ') and (tabuleiro[2][1] == tabuleiro[2][2]) and (tabuleiro[2][2] == tabuleiro[2][3]) then
	jogadorVenceu = tabuleiro[2][1]
	jogador = jogadorVenceu

		if(tabuleiro[2][1] == 'O') then
		pontBolinha = pontBolinha + 1
		end

		if(tabuleiro[2][1] == 'X') then
		pontXis = pontXis + 1
		end

	tabuleiro[2][1] = '-'
	tabuleiro[2][2] = '-'
	tabuleiro[2][3] = '-'

	return 3
	end

	if (tabuleiro[3][1] ~= ' ') and(tabuleiro[3][1] == tabuleiro[3][2]) and (tabuleiro[3][2] == tabuleiro[3][3]) then
	jogadorVenceu = tabuleiro[3][1]
	jogador = jogadorVenceu

		if(tabuleiro[3][1] == 'O') then
		pontBolinha = pontBolinha + 1
		end

		if(tabuleiro[3][1] == 'X') then
		pontXis = pontXis + 1
		end

	tabuleiro[3][1] = '-'
	tabuleiro[3][2] = '-'
	tabuleiro[3][3] = '-'

	return 3
	end

	return -1
end

function tabuleiro:VerificaVencedorVertical()

	if (tabuleiro[1][1]~=' ') and (tabuleiro[1][1] == tabuleiro[2][1]) and (tabuleiro[2][1] == tabuleiro[3][1]) then
	jogadorVenceu = tabuleiro[1][1]
	jogador = jogadorVenceu

		if(tabuleiro[1][1] == 'O') then
		pontBolinha = pontBolinha + 1
		end

		if(tabuleiro[1][1] == 'X') then
		pontXis = pontXis + 1
		end

	tabuleiro[1][1] = '|'
	tabuleiro[2][1] = '|'
	tabuleiro[3][1] = '|'

	return 3

	end

	if (tabuleiro[1][2]~=' ') and (tabuleiro[1][2] == tabuleiro[2][2]) and (tabuleiro[2][2] == tabuleiro[3][2]) then
	jogadorVenceu = tabuleiro[1][2]
	jogador = jogadorVenceu

		if(tabuleiro[1][2] == 'O') then
		pontBolinha = pontBolinha + 1
		end

		if(tabuleiro[1][2] == 'X') then
		pontXis = pontXis + 1
		end

	tabuleiro[1][2] = '|'
	tabuleiro[2][2] = '|'
	tabuleiro[3][2] = '|'

	return 3

	end

	if (tabuleiro[1][3]~=' ') and (tabuleiro[1][3] == tabuleiro[2][3]) and (tabuleiro[2][3] == tabuleiro[3][3]) then
	jogadorVenceu = tabuleiro[1][3]
	jogador = jogadorVenceu

		if(tabuleiro[1][3] == 'O') then
		pontBolinha = pontBolinha + 1
		end

		if(tabuleiro[1][3] == 'X') then
		pontXis = pontXis + 1
		end

	tabuleiro[1][3] = '|'
	tabuleiro[2][3] = '|'
	tabuleiro[3][3] = '|'

	return 3

	end

	return -1
end

function tabuleiro:VerificaVencedorDiagonal()

	if(tabuleiro[1][1]~=' ') and  (tabuleiro[1][1] == tabuleiro[2][2]) and (tabuleiro[2][2] == tabuleiro[3][3]) then
	jogadorVenceu = tabuleiro[1][1]
	jogador = jogadorVenceu

		if(tabuleiro[1][3] == 'O') then
		pontBolinha = pontBolinha + 1
		end

		if(tabuleiro[1][3] == 'X') then
		pontXis = pontXis + 1
		end

	tabuleiro[1][1] = '\\'
	tabuleiro[2][2] = '\\'
	tabuleiro[3][3] = '\\'

	return 3

	end

	if(tabuleiro[1][3]~=' ') and  (tabuleiro[1][3] == tabuleiro[2][2]) and (tabuleiro[2][2] == tabuleiro[3][1]) then
	jogadorVenceu = tabuleiro[1][1]
	jogador = jogadorVenceu

		if(tabuleiro[1][3] == 'O') then
		pontBolinha = pontBolinha + 1
		end

		if(tabuleiro[1][3] == 'X') then
		pontXis = pontXis + 1
		end

	tabuleiro[1][3] = '/'
	tabuleiro[2][2] = '/'
	tabuleiro[3][1] = '/'

	end

	return -1

end

function tabuleiro:VerificaEmpate()

	for i = 1, #tabuleiro, 1 do
		for j = 1, #tabuleiro[i], 1 do

			if(tabuleiro[i][j] == ' ') then

			return false

			end
		end
	end

	return true

end


function fimDoJogo()

testeHorizontal = tabuleiro:VerificaVencedorHorizontal()
testeVertical = tabuleiro:VerificaVencedorVertical()
testeDiagonal = tabuleiro:VerificaVencedorDiagonal()
testeEmpate = tabuleiro:VerificaEmpate()

	if testeHorizontal == 3 then
	print(tabuleiro:ShowTab())
	print("              -------------Jogador " .. jogador .." venceu!-------------" )
		if(jogador == 'O') then
		print("              -------------Quantidade de pontos " .. pontBolinha .."-------------" )
		end
		if(jogador == 'X') then
		print("              -------------Quantidade de pontos " .. pontXis .. "-------------" )
		end
	return true
	end

	if testeVertical == 3 then
	print(tabuleiro:ShowTab())
	print("              -------------Jogador " .. jogador .." venceu!-------------" )
		if(jogador == 'O') then
		print("              -------------Quantidade de pontos " .. pontBolinha .."-------------" )
		end
		if(jogador == 'X') then
		print("              -------------Quantidade de pontos " .. pontXis .. "-------------" )
		end
	return true
	end

	if testeDiagonal == 3 then
	print(tabuleiro:ShowTab())
	print("              -------------Jogador " .. jogador .." venceu!-------------" )
		if(jogador == 'O') then
		print("              -------------Quantidade de pontos " .. pontBolinha .."-------------" )
		end
		if(jogador == 'X') then
		print("              -------------Quantidade de pontos " .. pontXis .. "-------------" )
		end
	return true
	end

	if	testeEmpate then
	print(tabuleiro:ShowTab())
	print("                -------------Jogo terminou em empate.-------------")
	return true
	end

	return false

end

function tabuleiro:resetTabuleiro(number)
	if(number == 1 ) then
		for i = 1,  #tabuleiro, 1 do
			for j=1, #tabuleiro[i], 1 do
			tabuleiro[i][j] = ' '
			end
		end
	end
end

return tabuleiro
