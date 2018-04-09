
comecar = require("Tabuleiro")

OtherTab = comecar:NewTab()

function partida()

	repeat

		OtherTab:ShowTab()
		OtherTab:proximaJogada()

	until(fimDoJogo())
end

repeat

	partida()

	print("Jogar novamente?\n 1 - SIM , 2 - Nao")

	local novoJogo = io.read("*number")

	if novoJogo == 1 then

	OtherTab:resetTabuleiro(novoJogo)

	end


until(novoJogo == 2)

-- Min-Max
--funcao type que recebe como paramentro uma variavel
