programa
{
	inclua biblioteca Util --> u
	cadeia jogadores[10]
	caracter tabuleiro[3][3]
	inteiro l, c, linha, coluna, jogadas = 0, ganhou = 0
	logico finalPartida = falso
	cadeia jogador
	caracter tipoJogador = 'X', resposta = ' '

		
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

	funcao salvarJogadorNaLista(cadeia lista[]) {
		para(inteiro i=0; i<1; i++) {
			escreva("\nJogador " + (i+1) + " informe seu nome: ")
			leia(jogador)		
			se(lista[i] == "") {
				lista[i] = jogador
				escreva(jogador, " foi adicionado à lista \n\n")
			}
		}		
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

	//função para juntar todas as funções juntas e montar o jogo todo.
	funcao partidaJogadores() {
		limpa()
		faca{
			mostrarTabuleiro()
			escreva("\njogador escolha a LINHA e COLUNA da posição que quer jogar: ")
			leia(linha, coluna)
			se ((linha >= 0 e linha <= 2) e (coluna >= 0 e coluna <= 2)){
				// validarPosicao(linha, coluna)
				se(tabuleiro[linha][coluna] == ' '){
					fazerJogada(linha, coluna)
					validarFinalPartida(tabuleiro)	
				}senao{
					escreva("Movimento invalido, posição já preenchida. Tente novamente")
				}
			}			
		}enquanto(ganhou == 0 e jogadas < 9)
		escreva("Deseja jogar novamente?(y/n): ")
		leia(resposta)
		repetirPartidaJogadores(resposta)
	}



	funcao partidaJogadorCPU() {
		faca{
			mostrarTabuleiro()
			escreva("\njogador escolha a LINHA e COLUNA da posição que quer jogar: ")
			leia(linha, coluna)
			se ((linha >= 0 e linha <= 2) e (coluna >= 0 e coluna <= 2)){
				// validarPosicao(linha, coluna)
				se(tabuleiro[linha][coluna] == ' '){
					fazerJogada(linha, coluna)
					fazerJogadaCPU()
					validarFinalPartida(tabuleiro)	
				}senao{
					escreva("Movimento invalido, posição já preenchida. Tente novamente")
				}
			}			
		}enquanto(ganhou == 0 e jogadas < 9)
		escreva("Deseja jogar novamente?(y/n): ")
		leia(resposta)
		repetirPartidaJogadorCPU(resposta)
	}
	// função para validar se coordenadas descritas são válidas
/*	funcao validarPosicao(inteiro linha, inteiro coluna) {
		faca{
			se(linha < 0 ou linha > 2) {
				escreva("Linha inválida!\n")
			}senao se (coluna < 0 ou coluna > 2) {
				escreva("Coluna inválida!\n")
			}
		}enquanto((linha < 0 ou linha > 2) e (coluna < 0 ou coluna > 2))
	}*/

		//função para fazer a jogada
	funcao fazerJogada(inteiro linha, inteiro coluna) {
		se(tipoJogador == 'X') {
			tabuleiro[linha][coluna] = 'X'
			tipoJogador = 'O'
			jogadas++
		}senao {
			tabuleiro[linha][coluna] = 'O'
			tipoJogador = 'X'
			jogadas++
		}			
		
		
	}

	funcao fazerJogadaCPU() {
		faca{
	         	linha = u.sorteia(0,2)
			coluna = u.sorteia(0,2)
			se(tabuleiro[linha][coluna] == ' ') {	
				se(tipoJogador == 'X') {
					tabuleiro[linha][coluna] = 'X'
					tipoJogador = 'O'
					jogadas++
				}senao {
					tabuleiro[linha][coluna] = 'O'
					tipoJogador = 'X'
					jogadas++
				}
			}senao{
				fazerJogadaCPU()
			}
		}enquanto(jogadas>9)
	}
	
	funcao validarFinalPartida(caracter tabuleiro[][]) {
		//faca {
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
	    
	        
	        // verificar ganhador na diagonal normal(\)
			se(tabuleiro[0][0] == '0' e tabuleiro[1][1] == '0' e tabuleiro[2][2] == '0') {
				ganhou = 1
			}senao se(tabuleiro[0][0] == 'X' e tabuleiro[1][1] == 'X' e tabuleiro[2][2] == 'X') {
				ganhou = 2
			}
	          
	        // verificar ganhador na diagonal inversa(/)
			se(tabuleiro[0][2] == '0' e tabuleiro[1][1] == '0' e tabuleiro[2][0] == '0') {
				ganhou = 1
			}senao se(tabuleiro[0][2] == 'X' e tabuleiro[1][1] == 'X' e tabuleiro[2][0] == 'X') {
				ganhou = 2
			}
	//	}enquanto(ganhou == 0 e jogadas < 9)
		
		se(ganhou == 1) {
			escreva("\n\tParabéns Jogador 1. Você ganhou!\n\n")
		}senao se(ganhou == 2) {
			escreva("\n\tParabéns Jogador 2. Você ganhou!\n\n")
		} senao se(jogadas > 9) {
			escreva("\nEmpate!")
		}

	}

	funcao repetirPartidaJogadores(caracter resposta){
		se(resposta == 'y') {
			para(l = 0; l < 3; l++){
        			para(c = 0; c < 3; c++) {
        				tabuleiro[l][c] = ' '
        			}
      		}
			partidaJogadores()
		}senao se(resposta == 'n') {
			inicio()
		} senao {
			escreva("opção inválida!")
		}
		
	}

	funcao repetirPartidaJogadorCPU(caracter resposta){
		se(resposta == 'y') {
			para(l = 0; l < 3; l++){
        			para(c = 0; c < 3; c++) {
        				tabuleiro[l][c] = ' '
        			}
      		}
			partidaJogadorCPU()
		}senao se(resposta == 'n') {
			inicio()
		} senao {
			escreva("opção inválida!")
		}
		
	}

	
	funcao inicio(){
		inteiro opcao
		limpa()
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
					partidaJogadores()
					pare
				caso 2:
					partidaJogadorCPU()
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
 * @POSICAO-CURSOR = 5502; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {jogadas, 6, 30, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */