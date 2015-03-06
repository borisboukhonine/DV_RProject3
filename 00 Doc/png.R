### define myplot function, takes in dataframe and returns plot

myplot <- function(df, x) {
  names(df) <- c("x", "n")
  ggplot(df, aes(x=x, y=n)) + 
    geom_point() +
    theme(axis.text.x=element_text(angle=10, size=10,vjust=0.5))
}

### gets categoricals for smoek_free_states df
categoricals1 <- eval(parse(text=substring(gsub(",)", ")", getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from smoke_free_states"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_bb25684', PASS='orcl_bb25684', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'True'), verbose = TRUE)), 1, 2^31-1)))
# dataframe is cig_tax


l <- list()
for (i in names(mutated1)) { 
  if (i %in% categoricals1[[1]]) {
    r <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select \\\""i"\\\", count(*) n from smoke_free_states group by \\\""i"\\\""'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL',USER='C##cs329e_bb25684',PASS='orcl_bb25684',MODE='native_mode',MODEL='model',returnDimensions = 'False',returnFor = 'JSON', i=i),verbose = TRUE)))
    p <- myplot(r,i)
    print(p) 
    l[[i]] <- p
  }
}

png("/Users/boukhonine/Classes/DataVisualization/DV_RProject3/00 Doc/categoricals.png", width = 20, height = 20, units = "in", res = 72)
grid.newpage()
pushViewport(viewport(layout = grid.layout(2, 12)))   

print(l[[2]], vp = viewport(layout.pos.row = 1, layout.pos.col = 1:6))
print(l[[3]], vp = viewport(layout.pos.row = 1, layout.pos.col = 7:12))
print(l[[4]], vp = viewport(layout.pos.row = 2, layout.pos.col = 1:6))
print(l[[5]], vp = viewport(layout.pos.row = 2, layout.pos.col = 7:12))

dev.off()

myplot1 <- function(df, x) {
  names(df) <- c("x")
  ggplot(df, aes(x=x)) + 
    geom_histogram() +
    theme(axis.text.x=element_text(angle=10, size=10,vjust=0.5))
}


l2 <- list()
for (i in names(mutated1)) {   
  # For details on [[...]] below, see http://stackoverflow.com/questions/1169456/in-r-what-is-the-difference-between-the-and-notations-for-accessing-the
  if (i %in% categoricals1[[1]]) {
    r <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select \\\""i"\\\" from smoke_free_states"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL',USER='C##cs329e_bb25684',PASS='orcl_bb25684',MODE='native_mode',MODEL='model',returnDimensions = 'False',returnFor = 'JSON', i=i),verbose = TRUE)))

    p <- myplot1(r,i)
    print(p) 
    l2[[i]] <- p
  }
}

png("/Users/boukhonine/Classes/DataVisualization/DV_RProject3/00 Doc/categoricals2.png", width = 25, height = 25, units = "in", res = 72)
grid.newpage()
pushViewport(viewport(layout = grid.layout(2, 12)))   

print(l2[[2]], vp = viewport(layout.pos.row = 1, layout.pos.col = 1:6))
print(l2[[3]], vp = viewport(layout.pos.row = 1, layout.pos.col = 7:12))
print(l2[[4]], vp = viewport(layout.pos.row = 2, layout.pos.col = 1:6))
print(l2[[5]], vp = viewport(layout.pos.row = 2, layout.pos.col = 7:12))

dev.off()