pacman::p_load(tidyverse, rio)
pacman::p_load(gt) 

import("C:/R/CV-main/Agustin_Calatroni_pubmed.csv") %>% 
   select(PMID, Title, Authors, Journal = `Journal/Book`, Year = `Publication Year`) %>% 
   #slice(1:40) %>% 
   mutate(Title = str_glue("[{Title}](https://pubmed.ncbi.nlm.nih.gov/{PMID})")) %>%
   select(-PMID) %>%
   mutate(Authors = str_replace_all(Authors, "Calatroni A", "**Calatroni A**")) %>% 
   transmute(section = "academic_articles",
          in_resume = "TRUE",
          title = Title,
          loc = Journal,
          institution = '',
          start = Year,
          end = Year) %>% 
   export("C:/R/CV-main/Agustin_Calatroni_pubmed_transf.csv")
