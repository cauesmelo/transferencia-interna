extends Node

var game_stage = 0
var enable_moving = false
var show_text = true
var show_goal = false
var part = 0
var goal_text = ""

var labels = []
var finish_text_cb

var labels_game_start = [
	"O primeiro passo é utilizar o computador para buscar informações no site da Unirio...",
	"Você consegue se mover utilizando as setas. Aperte espaço para interagir com objetos."
]

var labels_computer = [
	"Luana pesquisa o site da Unirio no Google...",
	"E descobre que precisa separar uma cópia da Identidade, comprovante de matrícula e seu histórico escolar.",
	"Além disso, é necessário cumprir alguns pré-requisitos para poder solicitar a transferência interna, sendo eles...",
	"1. Possuir CRA igual ou superior a seis nos períodos realizados no curso de origem.",
	"2. Ter frequência mínima de 80% nos componentes currículares cursados nos períodos realizados no curso de origem.",
	"3. Ter condições de concluir o Curso pleiteado no prazo máximo de integralização curricular, (...)", 
	"(...) incluindo o período de dilatação para a integralização, contando o tempo a partir do ingresso do estudante na Unirio.",
	"Como não há nenhum impedimento. Luana salva a listagem de documentos e um protocolo de requerimento de mudança de curso."
]

var labels_computer_empty = [
	"Não há nada para fazer no computador agora."
]

func _ready():
	labels = labels_game_start
	finish_text_cb = func(): set_goal("Buscar informações no computador")
	
func load_texts(texts):
	enable_moving = false
	show_text = true
	labels = texts
	part = 0
	show_goal = false
	
func set_goal(goal):
	goal_text = goal
	show_goal = true
	
func use_computer():
	if(game_stage == 0):
		load_texts(labels_computer)
		game_stage = 1
		return
		
	if(game_stage == 1):
		load_texts(labels_computer_empty)
