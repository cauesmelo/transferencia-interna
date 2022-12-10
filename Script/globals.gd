extends Node

var game_stage = 0
var enable_moving = false
var show_text = true
var show_goal = false
var part = 0
var text_is_done = false
var goal_text = ""
var pos = 0

var labels = []
var finish_text_cb

var debug = false

var scene_room = preload("res://Level/luana_room.tscn")
var scene_house = preload("res://Level/luana_house.tscn")
#var scene_bus = preload("res://Level/luana_neighboorhood.tscn")
#var scene_uni = preload("res://Level/unirio_bus.tscn")
#var scene_bsi = preload("res://Level/unirio_bsi.tscn")
#var scene_cn = preload("res://Level/unirio_cn.tscn")
var scene_time_skip = preload("res://Level/time_skip.tscn")
var scene_time_skip2 = preload("res://Level/time_skip2.tscn")

var labels_game_start = [
	"O primeiro passo é utilizar o computador para buscar informações no site da Unirio...",
	"Você consegue se mover utilizando as setas. Aperte espaço para interagir com objetos."
]

var labels_computer = [
	"Luana acessa o portal da Unirio e descobre que a Pro-reitoria de graduação publica um edital para vagas (...)",
	"Remanescentes dos cursos da Unirio, permitindo que os estudantes solicitem a transferência interna entre cursos.",
	"Para isso, precisa separar uma cópia da Identidade, comprovante de matrícula e seu histórico escolar.",
	"Além disso, é necessário cumprir alguns pré-requisitos para poder solicitar a transferência interna, sendo eles...",
	"1. Possuir CRA (Coeficiente de rendimento acadêmico) igual ou superior a 6 nos períodos realizados no curso de origem.",
	"2. Ter frequência mínima de 80% nos componentes currículares cursados nos períodos realizados no curso de origem.",
	"3. Ter condições de concluir o Curso pleiteado no prazo máximo de integralização curricular, (...)", 
	"(...) incluindo o período de dilatação para a integralização, contando o tempo a partir do ingresso do estudante na Unirio.",
	"Como não há nenhum impedimento. Luana salva a listagem de documentos e um protocolo de requerimento de mudança de curso."
]

var labels_closet = [
	"Luana separa uma cópia da identidade, comprovante de matrícula e histórico",
	"Agora é necessário preencher o formulário em cima da mesa."
]

var labels_form = [
	"Luana preenche o formulário.",
	"Agora é necessário ir até a coordenação do curso de ciências da natureza. Siga as setas!"
]

var labels_cn = [
	"Luana: Boa tarde, eu preciso realizar uma transferência interna de curso.",
	"Luana: Aqui estão os documentos e o formulário preenchido como pede o site.",
	"Jorge: Boa tarde, me parece que está tudo certo. Tem certeza que deseja solicitar a transferência?",
	"Luana: Sim, eu tenho certeza!",
	"Jorge: Tudo bem, como você cumpre todos os pré-requisitos, basta aguardar a publicação do edital no site.",
	"Luana: Certo, muito obrigado pela atenção."
]

var labels_bsi = [
	"Luana: Boa tarde, eu fui selecionada no edital de transferência interna e já estou com toda a documentação.",
	"João: Boa tarde! Fico feliz de saber que foi aprovada! Me dê somente um minutinho para conferir os documentos.",
	"João: ...",
	"João: Só mais um minutinho para eu ver no sistema...",
	"João: ...",
	"João: Está tudo em ordem! Os dados estão registrados no sistema e a transferência foi concluída com sucesso.",
	"Luana: Eba! Muito obrigado pela ajuda. Já estou ansiosa para começar as aulas!"
]

var labels_computer2 = [
	"Luana entra no site da Unirio e realiza a inscrição no processo seletivo para transferência interna.",
	"Agora basta aguardar o resultado do processo seletivo."
]

var labels_computer3 = [
	"Luana entra no site da Unirio e acessa o resultado do processo de seleção para transferência interna.",
	"Ela abre a lista de selecionados e...",
	"Foi aprovada no processo seletivo!!!",
	"Agora basta ir na coordenação de BSI com toda a documentação exigida pelo edital para concluir o processo."
]

var labels_computer_empty = [
	"Não há nada para fazer no computador agora."
]

var labels_closet_empty = [
	"Não há nada para fazer no armário agora."
]

var labels_cn_empty = [
	"Jorge: Boa tarde Luana! Espero que esteja tudo bem contigo."
]

var labels_bsi_empty = [
	"João: ..."
]

func _ready():
	if(debug):
		show_text = false
		enable_moving = true
		set_goal("goal debugdebug debug debugbug")
		game_stage = 3
		
	labels = labels_game_start
	finish_text_cb = func(): set_goal("Buscar informações no computador")
	
func load_texts(texts):
	enable_moving = false
	show_text = true
	labels = texts
	part = 0
	text_is_done = false
	show_goal = false
	
func set_goal(goal):
	goal_text = goal
	show_goal = true
	
func use_computer():
	if(game_stage == 2):
		return
	
	if(game_stage == 0):
		load_texts(labels_computer)
		finish_text_cb = func(): set_goal("Buscar documentos no armário")
		game_stage = 1
		return
	elif(game_stage == 4):
		load_texts(labels_computer2)
		game_stage = 5
		finish_text_cb = func(): 
			set_goal("Verificar resultado do processo seletivo")
			SceneTransition.transition_to("res://Level/time_skip2.tscn")
			finish_text_cb = func(): pass
	elif(game_stage == 5):
		load_texts(labels_computer3)
		game_stage = 6
		finish_text_cb = func(): 
			set_goal("Ir para coordenação de BSI")
	else:
		load_texts(labels_computer_empty)

func use_closet():
	if(game_stage == 1):
		load_texts(labels_closet)
		finish_text_cb = func(): 
			set_goal("Preencher formulário no mesa")
			game_stage = 2
	else:
		load_texts(labels_closet_empty)
		
func use_prof_bsi():
	if(game_stage == 6):
		load_texts(labels_bsi)
		finish_text_cb = func(): 
			game_stage = 7
			SceneTransition.transition_to("res://Level/time_skip3.tscn")
			finish_text_cb = func(): pass
	else:
		load_texts(labels_bsi_empty)
	
func use_prof_cn():
	if(game_stage == 3):
		load_texts(labels_cn)
		finish_text_cb = func(): 
			set_goal("Realizar inscrição no computador")
			game_stage = 4
			SceneTransition.transition_to("res://Level/time_skip.tscn")
			finish_text_cb = func(): pass
	else:
		load_texts(labels_cn_empty)

func use_form():
	load_texts(labels_form)
	finish_text_cb = func(): set_goal("Ir para coordenação de CN")
	game_stage = 3

func restart_game():
	game_stage = 0
	enable_moving = false
	show_text = true
	show_goal = false
	part = 0
	text_is_done = false
	goal_text = ""
	pos = 0
	labels = []
	finish_text_cb = func(): pass
