# get dataframes from server

smoke_free <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from smoke_free_states"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_bb25684', PASS='orcl_bb25684', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))
smoke_free %>% tbl_df

cig_tax <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from cig_tax"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_bb25684', PASS='orcl_bb25684', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))
cig_tax %>% tbl_df

cig_tax %>% inner_join(smoke_free, by="STATES")

View(sorted_cig %>% inner_join(sorted_smoke, by=c("YEAR", "STATES")))

injoined <- sorted_cig %>% inner_join(sorted_smoke, by=c("YEAR", "STATES"))
injoined %>% mutate(tax_percent=cume_dist(CIGARETTE_TAX_DOLLAR_PER_PACK))
mut<-injoined %>% mutate(tax_percent=cume_dist(CIGARETTE_TAX_DOLLAR_PER_PACK))
g <- mut %>% ggplot(aes(x=YEAR, y=tax_percent))+geom_point()

g+ggtitle('Cigarette Tax % by State per Year')+guides(col=guide_legend(ncol=3))+labs(x='Year', y='Percent Tax on Cigarettes')+theme(axis.title.x=element_text(vjust=-0.35), axis.title.y=element_text(vjust=1.25), plot.title=element_text(vjust=1))

df <- injoined %>% select(STATES, YEAR, CIGARETTE_TAX_DOLLAR_PER_PACK, TYPE_OF_RESTRICTION) %>% filter(TYPE_OF_RESTRICTION != "No law, designated areas, or separate ventilation law")
d<- df %>% group_by(STATES) %>% summarize(minyear=min(YEAR), avg_tax=mean(CIGARETTE_TAX_DOLLAR_PER_PACK))
g<-d %>% ggplot(aes(x = STATES, y = minyear))+geom_point(aes(size=avg_tax, color=avg_tax))+scale_size_continuous(range=c(2,15),name="Average Tax in $\n from 1995-2014")
g+ggtitle('First Year of Smoking Ban by State,\n with Average Tax in Dollars')+theme(axis.text.x=element_text(angle=50, size=14,vjust=0.5), axis.text.y=element_text(size=14,vjust=0.5), plot.title=element_text(vjust=1, size=25))+labs(x='State', y='First Year of Smoking Ban')+theme(legend.title=element_text(size=17.235235235))+scale_color_continuous(name="Average Tax in $\n from 1995-2014")

