# get dataframes from server

# data on no-smoking ordinances from 1995-2014 by state
smoke_free <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from smoke_free_states"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_bb25684', PASS='orcl_bb25684', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))
smoke_free %>% tbl_df

# data on cigarette taxes in dollars per pack from 1995-2014 by state
cig_tax <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from cig_tax"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_bb25684', PASS='orcl_bb25684', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))
cig_tax %>% tbl_df

