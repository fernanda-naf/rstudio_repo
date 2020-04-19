# Introdução ao R

# comparar peso e altura de um grupo de meninos e meninas

peso <- c(46,40,36,60,36,37,40,36,45,65)
altura <- c(164,158,162,166,154,154,156,158,149,152)
sexo <- c("F","F","F","F","F","M","M","M","M","M")

imc <- peso/(altura/100)^2

mean(imc)

tapply(imc,sexo,mean)

# A fun??o tapply retorna o resultado de imc (m?dia) por sexo.


#fun??o getwd: informa onde os arquivos do working directory, ou ?rea de trabalho, est?o sendo armazenados.
getwd() 

#fun??o setwd: define o caminho da ?rea de trabalho
setwd("~/Estudando_o_R")

# Pacotes(packages) em R s?o bibliotecas contendo fun??es e dados, 
# ... que n?o t?m uma utilidade geral, mas s?o importantes para alguma finalidade espec?fica. 
# S?o exemplos de pacotes:

# xlsx -  para manipular arquivos xlsx
# rmarkdown - gerar relat?rios din?micos
# sqldf - permite usar o comando select da linguagem SQL
# ggplot2 - permite gerar gr?ficos de alta qualidade

# Se estiver conectada ? internet e for instalar um pacote oficial, 
# ... basta usar o comando install.packages() com o nome do pacote desejado entre aspas. 


install.packages("ggplot2")

# Para usar o pacote, basta digitar a fun??o library("nome do pacote") ou require("nome do pacote)

library(ggplot2) 

# H? varia formas de obter ajuda no R:

#fun??o help() ou ? - apresenta o help de um termo
# fun??o help.search() ou ?? - realiza pesquisa de termos. 
# fun??o example() - executa os exemplos do help
# help.start() -  abrem um manual on-line do R

# O help do R foi escrito para usu?rios intermedi?rios/avan?ados.

# O help de um termo ? dividido em sess?es: Descripton, Usage, Arguments, Value, References, See also an Example

idade <- c(18, 17, 19, 21, 22, 25, 18, NA)
area   <- c(1,1,2,1,2,2,1,1) #( 1 - Exatas, 2 - Humanas) 
genero <- c("f", "m", "f", "f", "m", "f", "m", "f") 

idade [2]
area [1:3]




amostra <- sample (c("banana", "ma?a", "jilo"), 
                   size = 100, 
                   replace = T,
                   prob = c(1/3, 1/2,1/6 ))
table(amostra)     


amostra <- sample (c("sim", "nao"), 
                   size = 600, 
                   replace = T,
                   prob = c(2/3, 1/3 ))
table(amostra)


# criar um dataframe

idade <- c(18, 17, 19, 21, 22, 25, 18, NA)
area   <- c(1,1,2,1,2,2,1,1)
genero <- c("f","m","f","f","m","f","m","f")

dados <- data.frame ( area, genero, idade)

dados 



# Para acessar os valores de vari?vel em data frame, digite o nome do data frame 
# ... seguido por $ e pelo nome da vari?vel.

dados$area

# Observa??es (linhas) e vari?veis (colunas) de um data frame podem ser extra?dos com o operador [ linha, coluna ].

# dados [ x , y ] - elemento na x? linha e y?  coluna.
# dados [   , y  ] - todas as linhas da y? coluna.
# dados [x ,     ] - todas as colunas da x? linha. 
# dados[n] - retorna um data frame formado pela coluna n. 


# Gr?ficos
# O primeiro argumento da fun??o ggplot ? um data frame. 
# aes() descreve como as vari?veis s?o mapeadas em aspectos visuais 
# ... (posi??o, cores, formas e tamanho) na forma geom?tricas definidas pelos geoms.

O exemplo apresenta a geom?trica de pontos, definida pela fun??o geom_point()

ggplot(data = mtcars, aes(x = disp, y = mpg)) + geom_point()


# separando s?ries por cores diferentes
ggplot(data = mtcars, 
       aes(x = disp, y = mpg, colour = as.factor(am))) + geom_point()



# grada??o de cores

ggplot(mtcars, aes(x = disp, 
                   y = mpg, colour = cyl)) + 
  geom_point()


# histograma com 5 barras laranjas e contornos pretos:

ggplot(mtcars, aes(x = mpg)) + 
  geom_histogram( color = "black",
                  fill = "orange",
                  bins=5)

# boxplot

ggplot(mtcars, aes(x = as.factor(cyl),
                   y = mpg)) + 
  geom_boxplot( color = "black",
                fill = "light blue")


# 2 s?ries distintas... uma de transmiss?o autom?tica ou manual (0 e 1) e outra de n?mero de
#... cilindradas, sendo que size coloca por ordem crescente do n?mero de cilindradas

ggplot(mtcars, aes(x = hp, 
                   y = mpg, 
                   fill = as.factor(am), 
                   size = cyl)) + 
  geom_point(shape = 21)


# Quando estamos mapeando vari?veis, fazemos isso dentro do comando aes(). 
# Quando estamos apenas mudando a est?tica do gr?fico, sem vincular isso 
# ... a alguma vari?vel, fazemos isso fora do comando aes().


# Para alterar os t?tulos dos eixos adiciona-se as fun??es xlab()ou ylab(). 
# J? para ajustar os limites dos gr?ficos tem-se as fun??es  xlim() e ylim().

z <- seq(10.4,33.9, length.out = 6)

ggplot(mtcars, aes(x = mpg)) + 
  geom_histogram(fill = "skyblue",
                 color = "black", 
                 breaks = z) +
  xlab("Milhas por gal?o") +
  ylab("Frequ?ncia") +
  xlim(c(10, 34)) +  
  ylim(c(0,13))


# LEGENDAS: Para trocar o t?tulo da legenda, use o argumento fill  da fun??o labs() 
# ... e para  alterar a sua posi??o, use o argumento legend.position da fun??o theme(legend.position=)


ggplot(iris,aes(x=Petal.Width,
                y=Petal.Length, 
                fill=Species)) + 
  geom_point(shape = 21, size = 3) + 
  labs(x = "Largura das P?talas (cm)",
       y = "Altura das P?talas (cm)", 
       fill = "Esp?cie") +   
  theme(legend.position="bottom")



# O pacote "ggthemes" j? vem com v?rios temas pr?-programados, 
# ... replicando formata??es de sites como The Economist, The Wall Street Journal 
# ... ou  aplicativos como Excel, entre outros!

# Esta ? uma forma r?pida e f?cil de adicionar um estilo diferente ao seu gr?fico.

install.packages("ggthemes")
library(ggthemes)

ggplot(iris, aes(x = Petal.Width, 
                 y = Petal.Length,
                 fill = Species)) +  
  geom_point(shape = 21, size = 3) + xlab("Largura das P?talas (cm) ") +
  ylab("Altura das P?talas (cm)") + 
  labs(fill="Esp?cie")+
  theme_wsj() + 
  scale_color_wsj() 

