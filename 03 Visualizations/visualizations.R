# first vis

g1 <- mutated1 %>% ggplot(aes(x=YEAR, y=cig_tax_distribution,color=STATES)) + 
  geom_point() + geom_line() + ggtitle('Cigarette Tax % by State per Year') + 
  guides(col=guide_legend(nrow=8)) + 
  labs(x='Year', y='Percent Tax on Cigarettes') + 
  theme(axis.title.x=element_text(vjust=-0.35), axis.title.y=element_text(vjust=1.25), plot.title=element_text(vjust=1), legend.position="bottom")
g1

# second vis

g2 <- mutated2 %>% ggplot(aes(x = STATES, y = minyear)) + geom_point(aes(size=avg_tax, color=avg_tax)) + 
  scale_size_continuous(range=c(2,15),name="Average Tax in $\n from 1995-2014") + 
  ggtitle('First Year of Smoking Ban by State,\n with Average Tax in Dollars') + 
  theme(axis.text.x=element_text(angle=50, size=10,vjust=0.5), axis.text.y=element_text(size=10,vjust=0.5), plot.title=element_text(vjust=1, size=25), legend.position="bottom") + 
  labs(x='State', y='First Year of Smoking Ban') + 
  theme(legend.title=element_text(size=17.235235235)) + 
  scale_color_continuous(name="Average Tax in $\n from 1995-2014") +
  guides(col=guide_legend(nrow=2))
g2

# third vis -- we thought utah was doing something weird

g3 <- filter2 %>% ggplot(aes(x=STATES, y=CIGARETTE_TAX_DOLLAR_PER_PACK, color=STATES)) + 
  geom_bar(stat="identity", position=position_dodge()) + 
  guides(col=guide_legend(ncol=3))+facet_wrap(~YEAR, nrow=3) + 
  ggtitle('Cigarette Tax in States Without Smoking Ban:\n1995, 2005, 2010') + 
  guides(col=guide_legend(nrow=8)) + 
  theme(axis.title.x=element_text(vjust=-0.35), axis.title.y=element_text(vjust=1.25), plot.title=element_text(vjust=1)) + 
  theme(axis.text.x=element_text(angle=50, size=10,vjust=0.5), axis.text.y=element_text(size=10,vjust=0.5), plot.title=element_text(vjust=1, size=25), legend.position="bottom") + 
  labs(x='State', y='First Year of Smoking Ban') + 
  theme(legend.title=element_text(size=17.235235235))
g3

