# get dataframes from server

# fish catch stats from atlantic ocean
atlantic <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from atlanticfishcatches"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_bb25684', PASS='orcl_bb25684', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))
atlantic %>% tbl_df

#fish catch stats from indian ocean
indian <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from indianfishcatches"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_bb25684', PASS='orcl_bb25684', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))
indian %>% tbl_df
