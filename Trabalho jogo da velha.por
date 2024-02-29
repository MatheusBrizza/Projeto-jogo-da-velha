programa
{
	cadeia jogadores[10]
	caracter tabuleiro[3][3]
	inteiro l, c, linha, coluna, jogadas = 0, ganhou = 0
	logico finalPartida = falso
	cadeia jogador
	caracter tipoJogador = 'X'

		
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
	
	//funÃ§Ã£o que salva o nome dos jogadores na lista de jogadores
	funcao salvarjogadoresNaLista(cadeia lista[]) {
		para(inteiro i=0; i<=1; i++) {
		escreva("\nJogador " + (i+1) + " informe seu nome: ")
		leia(jogador)		
			se(lista[i] == "") {
				lista[i] = jogador
				escreva(jogador, " foi adicionado à lista \n\n")
			}
		}
			// mÃ©todo para mostrar os jogadores da lista
			/*para(inteiro i=1; i<=2; i++) {
				escreva(lista[i], " ")
			}*/
			
	}
		//funÃ§Ã£o para criar o tabuleiro
	funcao mostrarTabuleiro() {

        escreva("\n\n 0   1    2\n\n")
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
          escreva("\n")
        }
	}
	
	funcao jogo(cadeia lista[]) {
		faca{
			mostrarTabuleiro()
			escreva("jogador escolha a linha e coluna da posição que quer jogar: ")
			leia(linha, coluna)
			validarPosicao(linha, coluna)
			validarFinalPartida(tabuleiro)
		}enquanto(finalPartida != verdadeiro)
	}
	// função para validar se coordenadas descritas são válidas
	funcao validarPosicao(inteiro linha, inteiro coluna) {
		se(linha < 0 ou linha > 2) {
			escreva("Linha inválida!\n")
		}senao se (coluna < 0 ou coluna > 2) {
			escreva("Coluna inválida!\n")
		}
	}

	funcao logico validarFinalPartida(caracter tabuleiro[][]) {
		faca {
			fazerJogada(linha, coluna)
			para(l = 0; l < 3; l++){
				se(tabuleiro[l][0] == '0' e tabuleiro[l][1] == '0' e tabuleiro[l][2] == '0'){
					ganhou = 1	
				} senao se(tabuleiro[l][0] == 'X' e tabuleiro[l][1] == 'X' e tabuleiro[l][2] == 'X') {
					ganhou = 2				
				}
			}
	            
	        // verificar ganhador por colunas
			para(c = 0; c < 3; c++){
				se(tabuleiro[0][c] == '0' e tabuleiro[1][c] == '0' e tabuleiro[2][c] == '0') {
					ganhou = 1				
				}senao se(tabuleiro[0][c] == 'X' e tabuleiro[1][c] == 'X' e tabuleiro[2][c] == 'X') {
					ganhou = 2		
				}
	        }
	    
	        
	        // verificar ganhador na diagonal normal
			se(tabuleiro[0][0] == '0' e tabuleiro[1][1] == '0' e tabuleiro[2][2] == '0') {
				ganhou = 1
			}senao se(tabuleiro[0][0] == 'X' e tabuleiro[1][1] == 'X' e tabuleiro[2][2] == 'X') {
				ganhou = 2
			}
	          
	        // verificar ganhador na diagonal inversa
			se(tabuleiro[0][2] == '0' e tabuleiro[1][1] == '0' e tabuleiro[2][0] == '0') {
				ganhou = 1
			}senao se(tabuleiro[0][2] == 'X' e tabuleiro[1][1] == 'X' e tabuleiro[2][0] == 'X') {
				ganhou = 2
			}
		}enquanto(ganhou == 0 e jogadas < 9)
		
		se(ganhou == 1) {
			escreva("\n\tParabéns Jogador 1. Você ganhou!\n\n")
		}senao se(ganhou == 2) {
			escreva("\n\tParabéns Jogador 2. Você ganhou!\n\n")
		}

		retorne finalPartida == verdadeiro
	}

	//função para fazer a jogada e validar se a coordenada está vazia
	funcao fazerJogada(inteiro linha, inteiro coluna) {
		se(tabuleiro[linha][coluna] != ' ') {
			escreva("Posição já preenchida!\n")
		}senao se(tipoJogador == 'X') {
			tabuleiro[linha][coluna] = 'X'
			tipoJogador = 'O'
			jogadas++
		}senao {
			tabuleiro[linha][coluna] = 'O'
			tipoJogador = 'X'
			jogadas++
		}
		
	}
	
	funcao inicio(){
		inteiro opcao
		faca{
			// setta as posições do tabuleiro vazia
			para(l = 0; l < 3; l++){
        			para(c = 0; c < 3; c++) {
        				tabuleiro[l][c] = ' '
        			}
      		}
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
					escreva("\nOpÃ§Ã£o invÃ¡lida! \n\n")
			}
		}enquanto(opcao != 0)
		
	} 
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1629; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {l, 5, 9, 1}-{c, 5, 12, 1}-{jogadas, 5, 30, 7}-{ganhou, 5, 43, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */