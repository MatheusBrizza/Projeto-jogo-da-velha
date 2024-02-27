programa
{
	cadeia jogadores[10]
	caracter tabuleiro[3][3]
	inteiro l, c
	
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
		cadeia jogador
		para(inteiro i=1; i<=2; i++) {
		escreva("\nJogador " + i + " informe seu nome: ")
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
      para(l = 0; l < 3; l++){
        para(c = 0; c < 3; c++)
          jogo[l][c] = ' '
      }
		para(l = 0; l < 3; l++){
        	  para(c = 0; c < 3; c++){
        	    escreva(" ", jogo[l][c])
  	        se(c < 2)
               escreva(" | ")
    	        se(c == 2)
               escreva("  ", l)
          }
          se(l < 2)
            escreva("\n------------")
          escreva("\n")
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
					mostrarTabuleiro()
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
 * @POSICAO-CURSOR = 567; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */