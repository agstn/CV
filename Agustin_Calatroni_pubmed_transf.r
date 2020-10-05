pacman::p_load(tidyverse, rio)
pacman::p_load(gt)

import("C:/R/CV/cv/Agustin_Calatroni_pubmed.csv") %>% 
   select(PMID, Title, Authors, Journal = `Journal/Book`, Year = `Publication Year`) %>% 
   slice(1:20) %>% 
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
   export("C:/R/CV/cv/Agustin_Calatroni_pubmed_transf.csv")

# 
# import("C:/R/CV/cv/csv-agustincal-set.csv") %>% 
#    select(PMID, Title, Authors, Journal = `Journal/Book`, Year = `Publication Year`) %>% 
#    slice(1:20) %>% 
#    mutate(Title = str_glue("[{Title}](https://pubmed.ncbi.nlm.nih.gov/{PMID})")) %>%
#    select(-PMID) %>%
#    mutate(Authors = str_replace_all(Authors, "Calatroni A", "**Calatroni A**")) %>% 
#    gt() %>% 
#    fmt_markdown(columns = TRUE) %>%
#    cols_hide(vars(Authors)) %>% 
#    cols_align(align = 'left',
#               columns = everything()) %>%
#    cols_width(vars(Title)   ~ px(325),
#               vars(Journal) ~ px(125),
#               vars(Year)    ~ px(50)) %>%
#    opt_table_font(
#       font = list(
#          google_font("Montserrat"),
#          default_fonts()
#       )
#    )  %>%
#    opt_row_striping() %>% 
#    
#    tab_options(
#       column_labels.hidden = TRUE,
#       row.striping.background_color = "#fafafa",
#       table.font.size = 10,
#       table_body.hlines.color = "#f6f7f7"
#    )
