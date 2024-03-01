programa
{
	inclua biblioteca Util --> u
	cadeia jogadores[10]
	caracter tabuleiro[3][3]
	inteiro l, c, linha, coluna, jogadas = 0, ganhador = 0
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
	
	//função que salva o nome dos jogadores na lista de jogadores para o placar(WIP)
	funcao salvarjogadoresNaLista(cadeia lista[]) {
		para(inteiro i=0; i<=1; i++) {
			escreva("\nJogador " + (i+1) + " informe seu nome: ")
			leia(jogador)		
			se(lista[i] == "") {
				lista[i] = jogador
				escreva(jogador, " foi adicionado à lista \n\n")
			}
		}	
	}
	
	//Função para salvar o nome do jogador na lista de jogadores para o placar(WIP)
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
	
	//função para mostrar o tabuleiro no console
	funcao mostrarTabuleiro() {

        escreva("\n\n 0    1    2\n\n")
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

	//função para executar o jogo de jogador X CPU
	funcao partidaJogadores() {
		limpa()
		faca{
			mostrarTabuleiro()
			escreva("\njogador ",tipoJogador, " escolha a LINHA e COLUNA da posição que quer jogar: ")
			leia(linha, coluna)
			se ((linha >= 0 e linha <= 2) e (coluna >= 0 e coluna <= 2)){
				se(tabuleiro[linha][coluna] == ' '){
					se (ganhador ==0) {
					fazerJogada(linha, coluna)	
					}					
				}senao{
					escreva("Movimento invalido, posição já preenchida. Tente novamente")
				}
			}			
		}enquanto(ganhador == 0 e jogadas < 9)
		escreva("Deseja jogar novamente?(y/n): ")
		leia(resposta)
		repetirPartidaJogadores(resposta)
	}

	//função para executar o jogo de jogador X CPU
	funcao partidaJogadorCPU() {
		limpa()
		faca{
			mostrarTabuleiro()
			escreva("\njogador ",tipoJogador, " escolha a LINHA e COLUNA da posição que quer jogar: ")
			leia(linha, coluna)
			se ((linha >= 0 e linha <= 2) e (coluna >= 0 e coluna <= 2)){
				se(tabuleiro[linha][coluna] == ' '){
					fazerJogada(linha, coluna)
					se (ganhador ==0) {
						fazerJogadaCPU()	
					}
				}senao{
					escreva("Movimento invalido, posição já preenchida. Tente novamente")
				}
			}			
		}enquanto(ganhador == 0 e jogadas < 9)
		escreva("Deseja jogar novamente?(y/n): ")
		leia(resposta)
		repetirPartidaJogadorCPU(resposta)
	}

	//funcao para executar o jogo de CPU x CPU
	funcao partidaCPUs() {
		limpa()
		faca{
			mostrarTabuleiro()
			//escreva("\njogador ",tipoJogador, " escolha a LINHA e COLUNA da posição que quer jogar: ")
			//leia(linha, coluna)
			se ((linha >= 0 e linha <= 2) e (coluna >= 0 e coluna <= 2)){
					se (ganhador ==0) {
						fazerJogadaCPU()	
					}
			}			
		}enquanto(ganhador == 0 e jogadas < 9)
		escreva("Deseja jogar novamente?(y/n): ")
		leia(resposta)
		repetirPartidaCPUs(resposta)
	}	
		
	//função que faz a jogada e muda a vez para o próximo jogador e aumenta o contador de jogadas
	funcao fazerJogada(inteiro linha, inteiro coluna) {
		se(tipoJogador == 'X') {
			tabuleiro[linha][coluna] = 'X'
			tipoJogador = 'O'
			jogadas++
			validarFinalPartida(tabuleiro)
		}senao {
			tabuleiro[linha][coluna] = 'O'
			tipoJogador = 'X'
			jogadas++
			validarFinalPartida(tabuleiro)
		}			
	}
	
	//função que faz a jogada do CPU e muda a vez para o jogador e aumenta o contador de jogadas
	funcao fazerJogadaCPU() {
		se(jogadas < 9) {
	         	linha = u.sorteia(0,2)
			coluna = u.sorteia(0,2)
			se(tabuleiro[linha][coluna] == ' ') {	
				se(tipoJogador == 'X') {
					tabuleiro[linha][coluna] = 'X'
					tipoJogador = 'O'
					jogadas++
					validarFinalPartida(tabuleiro)
				}senao {
					tabuleiro[linha][coluna] = 'O'
					tipoJogador = 'X'
					jogadas++
					validarFinalPartida(tabuleiro)
				}
			}senao{
				fazerJogadaCPU()
			}
		}
	}
	
	//função que verifica todas as maneiras de vencer para confirmar se teve vencedor
	funcao validarFinalPartida(caracter tabuleiro[][]) {
			//  verificar ganhador por linhas
			para(l = 0; l <= 2; l++){
				se(tabuleiro[l][0] == 'O' e tabuleiro[l][1] == 'O' e tabuleiro[l][2] == 'O'){
					ganhador = 1	
				} senao se(tabuleiro[l][0] == 'X' e tabuleiro[l][1] == 'X' e tabuleiro[l][2] == 'X') {
					ganhador = 2				
				}
			}
	            
	        // verificar ganhador por colunas
			para(c = 0; c <= 2; c++){
				se(tabuleiro[0][c] == 'O' e tabuleiro[1][c] == 'O' e tabuleiro[2][c] == 'O') {
					ganhador = 1				
				}senao se(tabuleiro[0][c] == 'X' e tabuleiro[1][c] == 'X' e tabuleiro[2][c] == 'X') {
					ganhador = 2		
				}
	        }
	    
	        
	        // verificar ganhador na diagonal normal(\)
			se(tabuleiro[0][0] == 'O' e tabuleiro[1][1] == 'O' e tabuleiro[2][2] == 'O') {
				ganhador = 1
			}senao se(tabuleiro[0][0] == 'X' e tabuleiro[1][1] == 'X' e tabuleiro[2][2] == 'X') {
				ganhador = 2
			}
	          
	        // verificar ganhador na diagonal inversa(/)
			se(tabuleiro[0][2] == 'O' e tabuleiro[1][1] == 'O' e tabuleiro[2][0] == 'O') {
				ganhador = 1
			}senao se(tabuleiro[0][2] == 'X' e tabuleiro[1][1] == 'X' e tabuleiro[2][0] == 'X') {
				ganhador = 2
			}
		se(ganhador == 1) {
			mostrarTabuleiro()
			escreva("\n\tParabéns Jogador O. Você ganhou!\n\n")
		}senao se(ganhador == 2) {
			mostrarTabuleiro()
			escreva("\n\tParabéns Jogador X. Você ganhou!\n\n")
		} senao se(jogadas >= 9) {
			mostrarTabuleiro()
			escreva("Empate!\n\n")
		}

	}
	//função que inicia uma partida nova se respoder y, se resposta for n volta ao menu inicial
	funcao repetirPartidaJogadores(caracter resposta){
			ganhador = 0
			jogadas = 0
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

	//função que inicia uma partida nova se respoder y, se resposta for n volta ao menu inicial
	funcao repetirPartidaJogadorCPU(caracter resposta){
			ganhador = 0
			jogadas = 0
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

	//função que inicia uma partida nova se respoder y, se resposta for n volta ao menu inicial
	funcao repetirPartidaCPUs(caracter resposta){
			ganhador = 0
			jogadas = 0
		se(resposta == 'y') {
			para(l = 0; l < 3; l++){
        			para(c = 0; c < 3; c++) {
        				tabuleiro[l][c] = ' '
        			}
      		}
			partidaCPUs()
		}senao se(resposta == 'n') {
			inicio()
		} senao {
			escreva("opção inválida!")
		}
		
	}
	// método para mostrar os jogadores da lista
	funcao mostrarPlacar(cadeia lista[]) {
					
		para(inteiro i=1; i<=2; i++) {
			escreva(lista[i], " ")
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
					pare
				caso 3:
					partidaCPUs()
					pare
				caso 4:
					mostrarPlacar(jogadores)
					escreva("Opção em desenvolvimento!\n")
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
 * @POSICAO-CURSOR = 8173; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */