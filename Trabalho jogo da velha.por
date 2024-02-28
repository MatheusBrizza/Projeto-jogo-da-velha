programa
{
	cadeia jogadores[10]
	caracter tabuleiro[3][3]
	inteiro l, c, linha, coluna
	logico temVencedor = falso
  cadeia jogador
	
	//função para gerar o menu inicial com as opções de jogo
	funcao menuInicial() {
		escreva("==> JOGO DA VELHA <== \n\n")
		escreva("Escolha o modo de jogo: \n")
		escreva("1) Jogador x Jogador \n")
		escreva("2) Jogador x CPU \n")
		escreva("3)     CPU x CPU \n")
		escreva("4) Mostrar placar \n")
		escreva("0) Sair \n\n")
		escreva("Escolha uma opção: ")
	}
	//função que salva o nome dos jogadores na lista de jogadores
	funcao salvarjogadoresNaLista(cadeia lista[]) {
		para(inteiro i=0; i<=1; i++) {
		escreva("\nJogador " + i+1 + " informe seu nome: ")
		leia(jogador)		
			se(lista[i] == "") {
				lista[i] = jogador
				escreva(jogador, " foi adicionado à lista \n\n")
			}
		}
		// método para mostrar os jogadores da lista
		/*para(inteiro i=1; i<=2; i++) {
			escreva(lista[i], " ")
		}*/
		
	}
	//função para criar o tabuleiro
	funcao mostrarTabuleiro() {
	escreva("\n\n 0   1    2\n\n")
      para(l = 0; l < 3; l++){
        para(c = 0; c < 3; c++)
          tabuleiro[l][c] = ' '
      }
		para(l = 0; l < 3; l++){
        	  para(c = 0; c < 3; c++){
        	    escreva(" ", tabuleiro[l][c])
  	        se(c < 2)
               escreva(" | ")
             se(c == 2)
              escreva("  ", l)
          }
          se(l < 2)
            escreva("\n------------")
          escreva("\n\n")
        }
		
	}

	funcao jogo(cadeia lista[]) {
		faca{
			mostrarTabuleiro()
      escreva("jogador escolha a linha e coluna da posi��o que quer jogar: ")
      leia(linha, coluna)
      validarPosicao(linha, coluna)

		}enquanto(temVencedor != verdadeiro)
		
		
	}

  funcao validarPosicao(inteiro linha, inteiro coluna) {
    se(linha < 0 ou linha > 2) {
      escreva("linha inv�lida!")
    }senao se (coluna < 0 ou coluna > 2) {
      escreva("coluna inv�lida!")
    }
  }
	
	funcao inicio()
	{
		inteiro opcao
		faca{
			menuInicial()
			leia(opcao)

			escolha(opcao) {
				caso 1:
					salvarjogadoresNaLista(jogadores)
					jogo(jogadores)
					escreva("1")
					pare
				caso 2:
					escreva("2")
					pare
				caso 3:
					escreva("3")
					pare
				caso 4:
					escreva("4")
					pare
				caso 0:
					pare
				caso contrario:
					escreva("\nOpção inválida! \n\n")
			}
		}enquanto(opcao != 0)
		
	} 
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1486; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */