# inner join

join1 <- cig_tax %>% inner_join(smoke_free, by=c("YEAR", "STATES"))
mutated1 <- join1 %>% mutate(cig_tax_distribution = cume_dist(CIGARETTE_TAX_DOLLAR_PER_PACK))
mutated1 %>% tbl_df

# left join

join2 <- cig_tax %>% left_join(smoke_free, by=c("YEAR", "STATES"))
filter1 <- join2 %>% select(STATES, YEAR, CIGARETTE_TAX_DOLLAR_PER_PACK, TYPE_OF_RESTRICTION) %>% 
  filter(TYPE_OF_RESTRICTION != "No law, designated areas, or separate ventilation law")
mutated2 <- filter1 %>% group_by(STATES) %>% 
  summarize(minyear=min(YEAR), avg_tax=mean(CIGARETTE_TAX_DOLLAR_PER_PACK))
mutated2 %>% tbl_df

# outer join

join3 <- cig_tax %>% full_join(smoke_free, by=c("YEAR", "STATES"))
filter2 <- join3 %>% select(STATES, YEAR, CIGARETTE_TAX_DOLLAR_PER_PACK, TYPE_OF_RESTRICTION) %>% 
  filter(TYPE_OF_RESTRICTION == "No law, designated areas, or separate ventilation law") %>% 
  filter(YEAR %in% c(1995, 2005, 2010))
filter2 %>% tbl_df

